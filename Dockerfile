FROM crystallang/crystal:1.2.0-alpine as builder

WORKDIR /app

COPY shard.yml .
COPY shard.lock .
RUN shards install

COPY lib lib
COPY src src
RUN crystal build --release src/travel_plans.cr -o /app/travel_plans

FROM alpine:3.14.2

WORKDIR /app
COPY --from=builder /app/travel_plans /app

# Install required dependencies
RUN apk --no-cache add libgcc libstdc++ pcre

EXPOSE 3000

CMD ["./travel_plans"]
