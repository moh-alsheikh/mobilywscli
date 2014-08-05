# Mobilywscli

 A command-line tool for Mobilyws. http://mobily.ws/ 
 
## Installation

Add this line to your application's Gemfile:

    gem 'mobilywscli'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mobilywscli

## Usage

First You will need to register for account at Mobily https://mobily.ws/sms/index.php?id=2

### Setup 

Add Mobilyws credentials (username - password - sender) 

    $ mobilywscli setup

### Balance 

Print current balance:

    $ mobilywscli balance
    
### Send SMS 

Send a new sms message:

    $ mobilywscli sendsms
    
### Service status

Check mobilyws statsu:

    $ mobilywscli status

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
