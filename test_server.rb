require 'net/http'

uri = URI('http://localhost:1234/')
req = Net::HTTP::Post.new(uri.path)
req.body = <<EOF
<?xml version='1.0' encoding='UTF-8'?>
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
 <SOAP-ENV:Body>
  <aetgt:getPriceForProduct 
    xmlns:OOP-demo="http://www.innoq.com/OOP-demo/"
    xmlns:aetgt="http://www.innoq.com/OOP-demo/"
    xmlns:result="http://saxon.sf.net/xquery-results"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
   <productId>4711</productId>
   <amount>3</amount>
  </aetgt:getPriceForProduct>
 </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
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