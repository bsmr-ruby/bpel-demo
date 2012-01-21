# Ruby BPEL Demo

### Installation
1. Install Ruby or [JRuby](http://jruby.org/)
2. Install the [bundler](http://gembundler.com/) dependency management gem:

        gem install bundler

    or

        sudo gem install bundler
2. Clone (`git clone git@github.com:tillsc/bpel-demo.git`) or [download](https://github.com/tillsc/bpel-demo/zipball/master) this repository
3. Install dependencies

        bundle install
 
### Running the demo
1. Start the BPEL server
2. Start the 'ProductService'

        bundle exec ruby server.rb

3. Do a request

        bundle exec ruby client.rb

### Testing the 'ProductService' service
There is a ruby script doing a very simple HTTP call to the 'ProductService'

    bundle exec ruby test_server.rb