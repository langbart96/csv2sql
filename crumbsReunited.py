import argparse
import os
import psycopg2


def execute_sql_file(cursor, sql_file_path):
    with open(sql_file_path, 'r', encoding='utf-8', errors='replace') as sql_file:
        cursor.execute(sql_file.read())


def check_table_exists(cursor, table_name):
    cursor.execute("""
        SELECT EXISTS (
            SELECT 1 FROM information_schema.tables WHERE table_name = %s
        );
    """, (table_name,))
    return cursor.fetchone()[0]


def add_foreign_keys(cursor, base_table_name, num_partitions):
    parent_table = f"{base_table_name}_part1"
    if not check_table_exists(cursor, parent_table):
        print(f"Error: Parent table {parent_table} does not exist.")
        return

    for i in range(2, num_partitions + 1):
        child_table = f"{base_table_name}_part{i}"
        if not check_table_exists(cursor, child_table):
            print(f"Error: Child table {child_table} does not exist.")
            continue

        try:
            cursor.execute(f"""
                ALTER TABLE {child_table}
                ADD CONSTRAINT fk_{child_table}_to_{parent_table}
                FOREIGN KEY (id) REFERENCES {parent_table}(id);
            """)
            print(f"Added foreign key from {child_table} to {parent_table}.")
        except psycopg2.Error as e:
            print(f"Error adding foreign key from {child_table} to {parent_table}: {e}")


def main():
    parser = argparse.ArgumentParser(description='Execute SQL files and add foreign keys to partitioned tables.')
    parser.add_argument('-d', '--directory_path', required=True, help='Path to the directory containing SQL files.')
    parser.add_argument('-n', '--db_name', help='Database name.')
    parser.add_argument('-u', '--db_user', required=True, help='Database user.')
    parser.add_argument('-p', '--db_password', required=True, help='Database password.')
    parser.add_argument('--db_host', default='localhost', help='Database host (default: localhost).')
    parser.add_argument('--db_port', default='5432', help='Database port (default: 5432).')

    args = parser.parse_args()

    sql_files = sorted(f for f in os.listdir(args.directory_path) if f.endswith('.sql'))

    with psycopg2.connect(
            dbname=args.db_name,
            user=args.db_user,
            password=args.db_password,
            host=args.db_host,
            port=args.db_port
    ) as connection:
        with connection.cursor() as cursor:
            for sql_file in sql_files:
                print(f"Executing {sql_file}...")
                execute_sql_file(cursor, os.path.join(args.directory_path, sql_file))

            connection.commit()

            if len(sql_files) > 1:
                print("Adding foreign keys to link partitions...")
                add_foreign_keys(cursor, sql_files[0].split('_part')[0], len(sql_files))

            connection.commit()
            print("Tables created and linked successfully.")


if __name__ == "__main__":
    main()
