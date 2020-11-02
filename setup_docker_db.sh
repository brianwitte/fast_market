#!/usr/bin/env bash
docker rm fast_market_db-psql
docker run --name fast_market_db-psql \
  -p 5432:5432 \
  -e POSTGRES_DB=fast_market_db\
  -e POSTGRES_PASSWORD=mysecretpassword \
  -d postgres:11.7-alpine

# docker exec -it ectop-psql bash
# psql -U postgres
