#!/bin/bash
mkdir periodic_table
cd periodic_table
git init
git checkout -b main
git commit -m "Initial commit"

touch element.sh
touch query_db.sql
chmod +x element.sh
psql -U freecodecamp periodic_table < query_db.sql

