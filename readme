# Ruby Script for Product Upload

Hello! I'm Abdessamad, and I'm thrilled to share my first Ruby script for uploading products. Despite being new to Ruby, I found the experience quite enjoyable.

## How to Run

_Without Docker:_

1.  First, run `gem install nokogiri` && `gem install dotenv`.
2.  Ensure you have a .env file in the root with values for:
    - `FTP_USERNAME`
    - `FTP_HOST`
    - `FTP_PASSWORD`
    - `SALSIFY_API_KEY`
3.  Run `ruby UploadScript.rb`.

_With Docker:_

1.  Make sure you have a .env file in the root with values for:
    - `FTP_USERNAME`
    - `FTP_HOST`
    - `FTP_PASSWORD`
    - `SALSIFY_API_KEY`
2.  Run `docker compose up --build`.

## How the Script Works

I've added comments to the code for explanation. In a nutshell:

1.  Set up environment variables (FTP credentials and Salsify Key).
2.  Download the products.xml file from FTP using the provided credentials.
3.  Parse the XML file into a Nokogiri document.
4.  Iterate through the document and extract the products.
5.  For each item, send it to the API using the Salsify Key.
6.  Log the response for each request.

## References

I relied on the Ruby documentation, Stack Overflow, and Docker Hub as references while navigating the Ruby world for this assignment.

## Libraries Used

I utilized two libraries: **Nokogiri** for XML parsing and **Dotenv** for loading environment variables. Additionally, I used built-in libraries like **net** and **json**. I chose Nokogiri and Dotenv due to their popularity, active maintenance, and recommendations from the Ruby community.

## Time Spent

I invested 2.5 hours in this exercise, with an additional half-hour ensuring the solution works locally without Docker. Given more time, I would prioritize implementing unit tests to cover various cases and comprehensive error handling, possibly adding end-to-end testing if unlimited time were available.

## Self-Critique

I would describe the code as a "working solution but probably not mature." As a Ruby novice, I acknowledge there may be unnoticed issues. Your feedback on any identified issues would be highly appreciated.
