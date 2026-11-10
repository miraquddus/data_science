"""Dolt demo in Python, as presented in class (DASC 6025, Sept 2024).

Uses the doltpy package, which DoltHub has since archived. The same steps are
reproduced with the current Dolt CLI in demo_cli.sh, which is the version to run today.
"""
from doltpy.core import Dolt
import pandas as pd

# Step 1: Initialize a new Dolt repository in the current directory
repo = Dolt.init("my_demo_repo")
repo.status()

# Step 2: Create a new table from a DataFrame and commit it
table_data = pd.DataFrame({
    "id": [1, 2, 3],
    "name": ["Alice", "Bob", "Charlie"],
    "age": [25, 30, 35],
})
repo.import_df("people", table_data, ["id"], commit=True, message="Initial commit")

# Step 3: Query the table
result = repo.sql("SELECT * FROM people")
print(result)

# Step 4: Check status and commit changes
repo.add("people")
repo.commit("Added initial data to people table")
