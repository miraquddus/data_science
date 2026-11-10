#!/usr/bin/env bash
# Dolt demo: Git-style version control for a SQL table.
# Walks through the steps shown in the presentation: create a database, add data,
# track changes with diff, branch and merge, and revert to a previous version.
set -euo pipefail

DB_DIR="${1:-my_demo_repo}"
rm -rf "$DB_DIR" && mkdir "$DB_DIR" && cd "$DB_DIR"

dolt config --global --get user.name  >/dev/null 2>&1 || dolt config --global --add user.name  "Demo User"
dolt config --global --get user.email >/dev/null 2>&1 || dolt config --global --add user.email "demo@example.com"

echo "== 1. Create a database"
dolt init

echo "== 2. Create a table, add data, and commit"
dolt sql -q "CREATE TABLE people (id INT PRIMARY KEY, name VARCHAR(50), age INT);"
dolt sql -q "INSERT INTO people VALUES (1,'Alice',25),(2,'Bob',30),(3,'Charlie',35);"
dolt add people
dolt commit -m "Initial commit: people table"
dolt sql -q "SELECT * FROM people;"

echo "== 3. Change data and inspect the diff before committing"
dolt sql -q "UPDATE people SET age = 31 WHERE name = 'Bob'; DELETE FROM people WHERE id = 3;"
dolt diff
dolt commit -am "Update Bob's age, remove Charlie"

echo "== 4. Branch, change data on the branch, and merge back"
dolt checkout -b add-dana
dolt sql -q "INSERT INTO people VALUES (4,'Dana',28);"
dolt commit -am "Add Dana on feature branch"
dolt checkout main
dolt merge add-dana
dolt sql -q "SELECT * FROM people ORDER BY id;"

echo "== 5. Audit trail"
dolt log --oneline

echo "== 6. Query a previous version (time travel), then revert the last change"
dolt sql -q "SELECT * FROM people AS OF 'HEAD~2';"
dolt revert HEAD
dolt sql -q "SELECT * FROM people ORDER BY id;"
