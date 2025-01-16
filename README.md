# CSV to SQL Script

This project contains two Python scripts that work together to automate the conversion of CSV files to SQL insert statements, including table partitioning if necessary, and then execute the SQL files in a PostgreSQL database. The two scripts are:

1. **`csv2sql.py`** - Converts CSV files into partitioned SQL tables with insert statements.
2. **`crumbsReunited.py`** - Executes the generated SQL files and adds foreign key constraints between partitioned tables.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/langbart96/csv2sql.git
    ```
2. Install the required dependencies:
    ```bash
    pip install -r requirements.txt

   
## Command-Line Arguments for **`csv2sql.py`**

### Arguments

- **`-i, --input`**: This argument is required and specifies the path to the input CSV file.
  
  **Example**: `-i data.csv`
  
- **`-o, --output`**: This argument is required and specifies the base path for the output SQL files.

  **Example**: `-o /path/to/output_folder`

- **`-t, --table`**: This argument is required and defines the name of the SQL table for which insert statements are created.

  **Example**: `-t my_table`

- **`-d, --delimiter`**: (Optional) Specifies the delimiter used in the CSV file. If not provided, the script will attempt to auto-detect the delimiter (supports `,` and `;`).

  **Example**: `-d ','`
  
  **Note**: If not specified, the delimiter is auto-detected based on the first row of the CSV.

- **`-p, --partition_size`**: (Optional) Specifies the maximum number of columns allowed per SQL partition. By default, the partition size is set to 1599 columns. If the CSV file exceeds this number of columns, it will be split into multiple tables.

  **Example**: `-p 1000`

  **Note**: The partition size cannot exceed 1599 columns, and if an invalid value is provided, an error will be raised.

### Example Usage

```bash
python csv_to_sql.py -i data.csv -o /path/to/output_folder/my_table -t my_table -d ',' -p 1000
```

## Command-Line Arguments for **`crumbsReunited.py`**

### Arguments

- **`-d, --directory_path`**: This required argument specifies the path to the directory containing the SQL files to be executed.

  **Example**: `-d /path/to/sql_files`

- **`-n, --db_name`**: (Optional) Specifies the name of the PostgreSQL database. If not provided, the script will use the default connection settings.

  **Example**: `-n my_database`

- **`-u, --db_user`**: This required argument specifies the PostgreSQL username used to connect to the database.

  **Example**: `-u postgres`

- **`-p, --db_password`**: This required argument specifies the password for the PostgreSQL user.

  **Example**: `-p mypassword`

- **`--db_host`**: (Optional) Specifies the database host. By default, the host is set to `localhost`.

  **Example**: `--db_host 192.168.1.100`

- **`--db_port`**: (Optional) Specifies the database port. By default, the port is set to `5432`.

  **Example**: `--db_port 5433`

### Example Usage

```bash
python execute_sql.py -d /path/to/sql_files -u postgres -p mypassword -n my_database --db_host 192.168.1.100 --db_port 5433
```