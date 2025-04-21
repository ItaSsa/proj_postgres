#!/bin/bash
set -e

POSTGRES_USER=postgres

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE DATABASE northwind;
EOSQL

# run script .sql in the new db
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname northwind -f  /tmp/northwind.sql