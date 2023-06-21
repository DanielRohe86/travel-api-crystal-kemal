FROM crystallang/crystal:1.2.1

# Set the working directory in the container
WORKDIR /app

RUN apt-get update && apt-get install -y libsqlite3-dev

# Copy the shard.yml and shard.lock files to the container
COPY shard.yml shard.lock ./

# Install project dependencies
RUN shards install --production

# Copy the rest of the application code to the container
COPY src ./src

# Build the Crystal application
RUN crystal build --release src/<your_entry_file>.cr

# Expose the port your application listens on
EXPOSE 3000

# Define the command to start your application
CMD ["./travel_plans"]
