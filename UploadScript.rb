
require 'net/ftp'
require 'nokogiri'
require 'net/http'
require 'uri'
require 'json'
require 'openssl'
require 'dotenv'

Dotenv.load

# Credentials for FTP server
ftp_host = ENV["FTP_HOST"]
ftp_username = ENV["FTP_USERNAME"]
ftp_password = ENV["FTP_PASSWORD"]

# Salsify API credentials
salsify_api_key = ENV["SALSIFY_API_KEY"]

# Connect to the FTP server
ftp = Net::FTP.new(ftp_host)
ftp.login(ftp_username, ftp_password)

# Download "products.xml" from the FTP server
ftp.getbinaryfile('products.xml', './products.xml')
ftp.close

# Parse the XML file into a Nokogiri document
xml_doc = Nokogiri::XML::Document.parse(File.open('products.xml'))

products = []
# Extract product data from the XML document
xml_doc.xpath('//product').each do |product|
  item_name = product['Item_Name']
  sku = product['SKU']
  brand = product.at('Brand').text
  color = product.at('Color')&.text
  msrp = product.at('MSRP')&.text
  bottle_size = product.at('Bottle_Size')&.text
  alcohol_volume = product.at('Alcohol_Volume')&.text
  description = product.at('Description')&.text

  product_hash = {
    'Item_Name' => item_name,
    'SKU' => sku,
    'Brand' => brand,
    'Color' => color,
    'MSRP' => msrp,
    'Bottle_Size' => bottle_size,
    'Alcohol_Volume' => alcohol_volume,
    'Description' => description
  }

  products << product_hash
end



# # Convert the extracted product data to JSON format
api_endpoint = URI.parse("https://app.salsify.com")

# Iterate over each product and send individual requests
products.each do |product|
    product_id = product["SKU"]
  # Convert the product hash to JSON
  json_data = JSON.generate(product)

  # Make a POST request to the API with the JSON data
  http = Net::HTTP.new(api_endpoint.host, api_endpoint.port)
    http.use_ssl = true 
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  request = Net::HTTP::Put.new("/api/v1/products/#{product_id}", { 'Content-Type' => 'application/json', "authorization" => "Bearer #{salsify_api_key}" })
  request.body = json_data

  response = http.request(request)
  puts "Response from the API for #{product['Item_Name']}: #{response.code}"
end




puts "Salsify products updated successfully!"