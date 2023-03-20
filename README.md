# DKB postgres import

Import the bookings from DKB.

## Prerequisits

- docker

## Install

Download the repo:

```
git clone 
cd 
```

Export the bookings from the website to csv. Download them and move them in this folder. 
Everything above the data of the file, including the header. 

Then execute these docker commands:

```
docker run -v ${PWD}:/workspace --rm -d -p5432:5432 -e POSTGRES_PASSWORD=mysecretpassword postgres
docker run -v ${PWD}:/workspace --rm --network host -it postgres psql postgresql://postgres:mysecretpassword@localhost:5432 -f /workspace/create.sql
```

## Execute sql query

Put your query in `query.sql`. Then execute: 

```
docker run -v ${PWD}:/workspace --rm --network host -it postgres psql postgresql://postgres:mysecretpassword@localhost:5432 -f /workspace/query.sql
```