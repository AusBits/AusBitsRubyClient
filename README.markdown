Ruby client for ausbits API
==========================

[![Build Status](https://travis-ci.org/ausbits/ausbits-client-ruby.png?branch=master)](https://travis-ci.org/ausbits/ausbits-client-ruby)

`ausbits-client-ruby` is a client for ausbits API, support all ausbits API functions like submit order, get tickers, etc. It's also a reference client implementation, where you can find how to authenticate private ausbits API.

### Requirements ###

* ruby 2.0.0 or higher (if you want to run 'rake test' in this gem you'll need ruby 2.1.0 or higher)
* openssl

### Install ###

    gem install ausbits_client

### Usage ###

#### Command line tool ####

TBD

#### REST API client ####

Use `#get` or `#post` to access API after you created a `ausbitsAPI::Client`:

```ruby
  require 'ausbits_client'

  # Client can be initialized not providing key and sercet, but this client can only access public APIs
  client_public = ausbitsAPI::Client.new endpoint: 'https://ausbits.com.au'

  # GET public api /api/v2/markets
  client_public.get_public '/api/v2/markets'

  # To build a full functional client which can access both public/private api, access_key/secret_key
  # are required.
  #
  # `endpoint` can be ignored or set to any ausbits powered exchange.
  #
  # If there's no data received in `timeout` seconds, Net::OpenTimeout will be raised. Default to 60.
  #
  client = ausbitsAPI::Client.new access_key: 'your_access_key', secret_key: 'your_secret_key', endpoint: 'https://ausbits.com.au', timeout: 60

  # GET private api /api/v2/orders with 'market=btcaud'
  client.get '/api/v2/orders', market: 'btcaud'

  # POST to create an order
  client.post '/api/v2/orders', market: 'btcaud', side: 'sell', volume: '0.11', price: '2955.0'

  # POST to create multiple orders at once
  client.post '/api/v2/orders/multi', market: 'btcaud', orders: [{side: 'buy', volume: '0.15', price: '2955.0'}, {side: 'sell', volume: '0.16', price: '2956'}]
```

Check [ausbits API v2 Documents](https://ausbits.com.au/documents/api_v2) for details on ausbits API.

### Streaming API client ###

Streaming API client is built upon eventmachine, it will start an endless loop to accept updates from server side, you only need to provide a callback block:

```ruby
  require 'ausbits_client'

  client = ausbitsAPI::StreamingClient.new access_key: 'your_access_key', secret_key: 'your_secret_key', endpoint: 'wss://ausbits.com.au:8080'
  client.run do |message|
    # do whatever you want with message
  end
```

### License ###

`ausbits-client-ruby` is released under MIT license. See [http://ausbits.mit-license.org](http://ausbits.mit-license.org) for more information.

### How To Contribute ###

Just create an issue or open a pull request :)
