FROM crystallang/crystal:1.2.1

WORKDIR /app

RUN apt-get update && apt-get install -y libsqlite3-dev

COPY shard.yml ./

RUN shards install

COPY src src

RUN crystal build --release src/travel_plans.cr

EXPOSE 3000

CMD ["./src/travel_plans"]
