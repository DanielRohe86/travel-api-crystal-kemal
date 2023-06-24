FROM crystallang/crystal:1.2.0-alpine as builder

WORKDIR /app

COPY shard.yml .
COPY shard.lock .
RUN shards install

COPY lib lib
COPY src src
COPY src/model src/model
RUN crystal build --release src/travel_plans_fetch.cr -o /app/travel_plans_fetch
RUN crystal build --release src/travel_plans_crud.cr -o /app/travel_plans_crud

FROM alpine:3.14.2

WORKDIR /app
COPY --from=builder /app/travel_plans_fetch /app/travel_plans_fetch
COPY --from=builder /app/travel_plans_crud /app/travel_plans_crud

RUN apk --no-cache add libgcc libstdc++ pcre

EXPOSE 3000

CMD tail -f /dev/null

