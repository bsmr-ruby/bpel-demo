require 'soap/rpc/standaloneserver'

class ProductService < SOAP::RPC::StandaloneServer

  PRICES = {
    "4711" => 2.5,
    "1234" => 50.00 
  }

  def initialize(*args)
    super
    add_method(self, 'getPriceForProduct', [
      ['in', 'productId'],
      ['in', 'amount'],
      ['retval', 'priceInEUR']
    ])
  end

  def getPriceForProduct(productId, amount)
    return PRICES[productId.to_s] * amount.to_f * 1.19
  end

end

server = ProductService.new('ProductService', 'http://www.innoq.com/OOP-demo/', 'localhost', 1234)
trap('INT') { server.shutdown }

puts "Starting Server..."
server.start