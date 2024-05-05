# Stage 1: Build environment
FROM ruby:3.2.3 AS build

WORKDIR /app

# Copy Gemfiles first to leverage caching
COPY Gemfile* ./
COPY Gemfile.lock ./

RUN gem cleanup

ARG PORT

# Set the environment variables using the build arguments
ENV PORT=${PORT}

# Install dependencies
RUN gem install bundler
RUN bundle install --jobs "$(nproc)" --retry 3 --deployment

# Copy the rest of the application files
COPY . .

# Start your Sinatra application
CMD bundle exec ruby app.rb -o 0.0.0.0 -p $PORT
