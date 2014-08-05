[icon]: https://mobily.ws/images/logo.png

# Mobilyws CLI

 A command-line tool for Mobilyws. http://mobily.ws/ 
 
## Installation

First, make sure you have Ruby installed.

**On a Mac**, open `/Applications/Utilities/Terminal.app` and type:

    ruby -v

If the output looks something like this, you're in good shape:

    ruby 2.0.0p353 (2013-11-22 revision 43784) [x86_64-darwin12.1.0]

If the output looks more like this, you need to [install Ruby][ruby]:
[ruby]: http://www.ruby-lang.org/en/downloads/

    ruby: command not found

**On Linux**, for Debian-based systems, open a terminal and type:

    sudo apt-get install ruby-dev

or for Red Hat-based distros like Fedora and CentOS, type:

    sudo yum install ruby-devel

(if necessary, adapt for your package manager)

**On Windows**, you can install Ruby with [RubyInstaller][].
[rubyinstaller]: http://rubyinstaller.org/


After that you can install mobilyws: 

    $ gem install mobilywscli

And then execute:

    $ bundle

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
