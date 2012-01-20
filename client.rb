require 'savon'

# SOAP Client http://savonrb.com/

# Client Setup
client = Savon::Client.new
client.wsdl.document = File.expand_path("demo.wsdl", File.dirname(__FILE__)) 

# WSDL content
puts "Client is now able to query '#{client.wsdl.endpoint}' (namespace '#{client.wsdl.namespace}')."
puts "The WSDL file specifies the following methods: "
puts client.wsdl.soap_actions.map{|a| "- #{a}"}.join("\n")

# Doing some request
response = client.request :place_order do |soap|
  soap.body do |xml|
    xml.products do 
      xml.product do
        xml.id "4711"
        xml.type "Original Eau de Cologne"
        xml.amount "3"
      end
    end
    xml.paymentType "CREDIT_CARD"
  end
end