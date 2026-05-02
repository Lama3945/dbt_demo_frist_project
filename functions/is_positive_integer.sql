-- syntax for BigQuery, Snowflake, and Databricks
-- This function return 1 if the input string is an integer ('10' -> return 1 but '+10' return 0)
REGEXP_INSTR(a_string, '^[0-9]+$')