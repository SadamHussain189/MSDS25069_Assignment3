# Assignment 3 — R script for Sakila DB queries

This repository contains an R script (`Assignment3_R_git.r`) used to run several SQL queries against the Sakila sample MySQL database. The script connects to a local MySQL server, executes queries (one per assignment question), and includes a ggplot2 visualization example.

## Repository contents

- `Assignment3_R_git.r` — Main R script. Contains code to connect to the Sakila database, run queries for multiple assignment questions, and create a bar plot of average rental rates by film rating.
- `sakila-db/` — SQL files for the Sakila sample database:
	- `sakila-schema.sql` — Schema to create Sakila tables.
	- `sakila-data.sql` — Data to populate the Sakila schema.
	- `sakila.mwb` — MySQL Workbench file (optional).

## Purpose

The R script demonstrates how to:

- Connect to a local MySQL instance using `DBI` and `RMySQL`.
- Execute SQL queries against the `sakila` database and retrieve results as data frames.
- Use `ggplot2` to visualize aggregated query results.

The script contains commented SQL queries for the following conceptual assignment questions (each query is included and commented):

1. Select films with rating `PG` and rental duration > 5.
2. Compute average rental rate grouped by film rating.
3. Count films grouped by language.
4. List customers and the store they belong to.
5. Retrieve payment records with staff member names.
6. Find films that have never been rented.
7. Plot average rental rate by rating using `ggplot2`.

## Prerequisites

- MySQL server running locally (or accessible) with the `sakila` database loaded.
- R (>= 3.5 recommended).
- R packages: `DBI`, `RMySQL`, `ggplot2`.

Install R packages (if needed):

```r
install.packages(c("DBI", "RMySQL", "ggplot2"))
```

## Setting up the Sakila database

1. Start your MySQL server.
2. Create the `sakila` database and import the schema and data. From the `sakila-db` directory run:

```bash
# Import schema
mysql -u root -p < sakila-db/sakila-schema.sql
# Import data
mysql -u root -p sakila < sakila-db/sakila-data.sql
```

Adjust `-u` and `-p` flags as needed for your MySQL user.

## How to update the connection

Open `Assignment3_R_git.r` and update the `dbConnect()` call with your MySQL credentials (user, password, host, port) and ensure `dbname = "sakila"`.

```r
con <- dbConnect(
	RMySQL::MySQL(),
	dbname = "sakila",
	host = "localhost",
	port = 3306,
	user = "root",
	password = "s"
)
```

Note: The current script uses `user = "root"` and `password = "s"` — change to your secure credentials before running.

## Running the script

1. Launch R or RStudio in the repository directory.
2. Source the script or run it interactively. For example:

```r
source("Assignment3_R_git.r")
```

Because many queries in the file are commented out, uncomment the query block(s) you want to run. Each block follows this pattern:

```r
query <- "...SQL..."
result <- dbGetQuery(con, query)
print(result)
```

For the ggplot2 visualization (Question 7), the script disconnects from the database and plots `avg_rental`.

## Expected outputs

- Data frames printed to the console for the executed queries (e.g., film lists, averages, counts).
- A bar plot showing average rental rate by film rating when the plotting code is uncommented and executed.

## Notes and suggestions

- Keep credentials out of version control. Consider using environment variables or a separate untracked config file for passwords.
- After running queries, call `dbDisconnect(con)` to close the connection (the script currently disconnects in the plotting block).
- You can easily expand the script to write query results to CSV files or save plots to disk using `ggsave()`.

## Author

Repository prepared by the student for MSDS25069 Assignment 3.

## Contact

If you have questions, open an issue or contact the repository owner.
