# Stage 1: Build environment
FROM ruby:3.2.2 AS build

WORKDIR /app

# Copy Gemfiles first to leverage caching
COPY Gemfile* ./

# Install dependencies
RUN gem install bundler && \
    bundle install --jobs "$(nproc)" --retry 3

# Copy the rest of the application files
COPY . .

# Stage 2: Production environment
FROM ruby:3.2.2-slim AS production

WORKDIR /app

# Copy only necessary files from the build stage
COPY --from=build /app .

# Expose the port your Sinatra app will run on
EXPOSE 4567

# Start your Sinatra application
CMD ["bundle", "exec", "ruby", "app.rb", "-p", "4567"]
