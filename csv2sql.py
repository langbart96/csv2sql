import argparse
import csv
import os


def detect_delimiter(csv_file_path):
    with open(csv_file_path, 'r') as csvfile:
        first_line = csvfile.readline()
        if ',' in first_line:
            return ','
        elif ';' in first_line:
            return ';'
        else:
            raise ValueError("Unable to detect delimiter. Please ensure the file uses ',' or ';'.")


def parse_arguments():
    parser = argparse.ArgumentParser(description='Takes a CSV file and a table name, then creates SQL insert statements with partitioning if necessary.')
    parser.add_argument('-i', '--input', dest='csv_file_path', required=True, help='The path to the CSV file.')
    parser.add_argument('-o', '--output', dest='sql_file_path', required=True, help='The base path for the output SQL files.')
    parser.add_argument('-t', '--table', dest='table_name', required=True, help='The name of the SQL table.')
    parser.add_argument('-d', '--delimiter', dest='delimiter', default=None, help='The delimiter used in the CSV file (optional). If not provided, it will be auto-detected.')
    parser.add_argument('-p', '--partition_size', dest='partition_size', type=int, default=1599, help='Maximum number of columns per partition (default 1599).')

    args = parser.parse_args()

    if args.partition_size > 1599:
        parser.error("Partition size must not exceed 1599.")

    return args


def get_max_lengths(csv_file_path, delimiter):
    with open(csv_file_path, newline='') as csvfile:
        csv_reader = csv.reader(csvfile, delimiter=delimiter)
        headers = next(csv_reader)
        num_columns = len(headers)
        max_lengths = [0] * num_columns

        for row in csv_reader:
            for i in range(min(len(row), num_columns)):
                max_lengths[i] = max(max_lengths[i], len(row[i]))

            # If the current row has fewer columns, ignore the rest
            if len(row) < num_columns:
                print(f"Warning: Row has fewer columns than expected: {row}")
            # If the current row has more columns, print a warning
            elif len(row) > num_columns:
                print(f"Warning: Row has more columns than expected: {row}")

    return max_lengths, headers


def csv_to_sql(csv_file_path, sql_file_path, table_name, delimiter=None, partition_size=1600):
    if delimiter is None:
        delimiter = detect_delimiter(csv_file_path)

    max_lengths, headers = get_max_lengths(csv_file_path, delimiter)
    num_partitions = (len(headers) + partition_size - 1) // partition_size

    with open(csv_file_path, newline='') as csvfile:
        csv_reader = csv.reader(csvfile, delimiter=delimiter)
        next(csv_reader)

        for partition in range(num_partitions):
            partition_headers = headers[partition * partition_size:(partition + 1) * partition_size]
            partition_max_lengths = max_lengths[partition * partition_size:(partition + 1) * partition_size]

            partition_table_name = f"{table_name}_part{partition+1}"
            partition_sql_file = f"{os.path.join(os.path.dirname(sql_file_path), partition_table_name)}.sql"

            with open(partition_sql_file, 'w') as sqlfile:
                sqlfile.write(f"DROP TABLE IF EXISTS {partition_table_name};\n\n")
                sqlfile.write(f"CREATE TABLE {partition_table_name} (\n")
                sqlfile.write(f"    id SERIAL PRIMARY KEY,\n")
                for i, header in enumerate(partition_headers):
                    column_name = header.replace("'", "")
                    column_length = max(partition_max_lengths[i], 1)
                    column_type = f"VARCHAR({column_length})"
                    if i == len(partition_headers) - 1:
                        sqlfile.write(f"    {column_name} {column_type}\n")
                    else:
                        sqlfile.write(f"    {column_name} {column_type},\n")
                sqlfile.write(");\n\n")

                csvfile.seek(0)
                next(csv_reader)
                for row_id, row in enumerate(csv_reader, start=1):
                    partition_values = row[partition * partition_size:(partition + 1) * partition_size]
                    values = ', '.join([f"'{value.replace("'", "")}'" for value in partition_values])
                    sqlfile.write(f"INSERT INTO {partition_table_name} (id, {', '.join(partition_headers).replace("'", "")}) VALUES ({row_id}, {values});\n")


if __name__ == "__main__":
    args = parse_arguments()
    csv_to_sql(
        csv_file_path=args.csv_file_path,
        sql_file_path=args.sql_file_path,
        table_name=args.table_name,
        delimiter=args.delimiter,
        partition_size=args.partition_size
    )

    print(f"SQL files have been created with partitioning based on a maximum of {args.partition_size} columns per table.")
