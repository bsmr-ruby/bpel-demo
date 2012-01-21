require 'net/http'

uri = URI('http://localhost:1234/')
req = Net::HTTP::Post.new(uri.path)
req.body = <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<env:Envelope 
  xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
  xmlns:wsdl="http://www.innoq.com/OOP-demo/" 
  xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" 
  xmlns:ins0="http://www.innoq.com/OOP-demo/">
 <env:Body>
  <ins0:getPriceForProduct>
   <productId>4711</productId>
   <amount>2</amount>
  </ins0:getPriceForProduct>
 </env:Body>
</env:Envelope>
EOF

res = Net::HTTP.start(uri.host, uri.port) do |http|
  http.request(req)
end

case res
when Net::HTTPSuccess
  puts "**** Success ****"
  puts res.body
else
  puts "**** ERROR ****"
  puts res.body
end