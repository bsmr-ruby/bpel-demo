# Ruby BPEL Demo

### Installation
0. Install Ruby or [JRuby](http://jruby.org/)
1. Clone (`git clone git@github.com:tillsc/bpel-demo.git`) or [download](https://github.com/tillsc/bpel-demo/zipball/master) this repository
2. Install dependencies

        bundle install
 
### Running the demo
1. Start the BPEL server
2. Start the 'ProductService'

        bundle execute ruby server.rb

3. Do a request

        bundle execute ruby client.rb

### Testing the 'ProductService' service
There is a ruby script doing a very simple HTTP call to the 'ProductService'

    bundle execute ruby test_server.rb