FROM paketobuildpacks/ruby

# Copy application code
COPY . /workspace

# Install Bundler and dependencies
RUN bundle install

# Run your application
CMD ["bundle", "exec", "ruby", "app.rb", "-p", "4567"]
