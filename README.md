# Postgres in Pot

This repository conains a script to create a [Pot](https://github.com/bsdpot/pot)
that will run PostgreSQL on FreeBSD

## Usage

- Build the pot
```sh
sh pot_build.sh <postgres-password>
```

This will initialize the database with user postgres and the password you passed to the script

- Run Postgres on FreeBSD!
```sh
pot start postgres
```

## Stopping Postgres

```sh
pot stop postgres
```

