FROM ruby:3.1


# Install Nokogiri gem
RUN gem install nokogiri

# Install RestClient gem
RUN gem install rest-client

# Copy the Ruby script to the Docker image
COPY UploadScript.rb /app/UploadScript.rb

# Set the working directory
WORKDIR /app

# Expose port 3000 for the Ruby script
EXPOSE 3000

# Run the Ruby script
CMD ["ruby", "UploadScript.rb"]