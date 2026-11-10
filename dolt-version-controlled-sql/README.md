# A Version-Controlled SQL Database with Dolt

**Data quality · auditability · SQL · Git-style workflows**

Tool evaluation for DASC 6025 *Data Cleaning and Quality Assessment*, East Carolina University (September 2024).

## Why it matters

When a table is edited by many people or pipelines, the usual questions are who changed a value, when, and what it was before. Ordinary SQL databases can't answer them without extra audit tables. [Dolt](https://github.com/dolthub/dolt) is a MySQL-compatible database with Git semantics built into the storage layer: every change can be diffed, committed, branched, merged, and reverted. That makes it useful for regulated data (finance, healthcare) and for any dataset where provenance matters.

## What's here

| File | Contents |
|---|---|
| `slides.pdf` | Evaluation: installation, installation problems and fixes, demo, pros and cons, comparison with traditional RDBMSs, application areas |
| `demo_cli.sh` | Runnable end-to-end demo with the current Dolt CLI: create, commit, diff, branch, merge, time-travel query, revert |
| `sample_output.txt` | Output of `demo_cli.sh` from a clean run (Dolt 2.7.2) |
| `demo_doltpy.py` | The Python version presented in class, using `doltpy` (since archived by DoltHub) |

## Run the demo

```bash
# install Dolt: https://docs.dolthub.com/introduction/installation
bash demo_cli.sh            # creates ./my_demo_repo
```

The demo shows:

1. Creating a `people` table and committing it
2. Updating and deleting rows, then reviewing a **cell-level diff** before committing
3. Making changes on a **feature branch** and merging them into `main`
4. Reading the **audit log**
5. Querying the table **as of an earlier commit** (`AS OF 'HEAD~2'`)
6. **Reverting** a bad change without losing history

## Evaluation summary

**Strengths:** Git-style versioning and collaboration · clear audit trails and data provenance · a good fit for compliance-heavy domains

**Limitations:** a learning curve for SQL users who don't know Git · performance overhead on large tables · a smaller ecosystem than PostgreSQL or MySQL · Windows installation friction (PATH setup, `doltpy` dependency)
