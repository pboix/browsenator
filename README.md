# Browsenator
[![Build Status](https://travis-ci.org/aidamanna/browsenator.svg?branch=master)](https://travis-ci.org/aidamanna/browsenator)

Browsenator is a Watir wrapper to make starting local and remote browsers easier.

Big thanks to Browserstack for allowing us to use their tool for developing this project.

[![Browserstack](https://user-images.githubusercontent.com/9199692/40190142-59ef2694-59fe-11e8-87fa-77aaec1e2575.png)](https://www.browserstack.com)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'browsenator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aida

## Configuration

To use remote Browsertack browsers, configure the following environment variables:

- BROWSERSTACK_USERNAME
- BROWSERSTACK_ACCESS_KEY

## Usage

### Local browser

Start a local browser:

```ruby
Browsenator.for(:chrome)
```

You can start the following local browsers: `:chrome`, `:firefox`, `:safari`.

Chrome and Firefox browsers can be started in headless mode:

```ruby
Browsenator.for(:chrome, headless: true)
```

If you specify headless property for Safari, Browsenator will just ignore it.

#### Browser versions
For local browsers Browsenator will always start the browser version that you have installed in your computer.

Additionally, you will need to have installed the corresponding browser driver:

- Google Chrome: chromedriver
- Mozilla Firefox: geckodriver
- Apple Safari: safaridriver (no download is needed, it is pre-installed if you have Safari 10 or latter).

In Safari, you will also need to allow remote automation option (under Develop menu). 

#### Defaults

- Browser window is resized to: 1004 x 748

### Remote browser

Start a remote browser:

```ruby
Browsenator.for(:chrome, remote: :browserstack)
```

Currently, remote browsers are only available through Browserstack.

You can start the following remote browsers: `:chrome`, `:safari`, `:edge`, `:ie`.

#### Browser versions

You can specify the browser version you want to use:

```ruby
Browsenator.for(:chrome, remote: :browserstack, browser_version: '65.0')
```

Check [capabilities](https://www.browserstack.com/automate/capabilities) in Browserstack to know which browser versions to use.

#### Defaults

- Resolution: 1024 x 768
- Chrome browser: v66 - High Sierra
- Safari browser: v11.1 - High Sierra
- Edge browser: v17 - Windows 10
- IE browser: v11 - Windows 10

#### Other configurations

##### Project name

Specify project name in Browserstack execution:

```ruby
Browsenator.for(:chrome, remote: :browserstack, project: 'Functional Test')
```

##### Local testing

By default local testing is set to false. You can enable it by setting `local_testing` to `true`:

```ruby
Browsenator.for(:chrome, remote: :browserstack, local_testing: true)
```

Note: This property will only set the correct capability so that local testing is enabled. However, to make it work, you still need to setup your [Local Testing connection](https://www.browserstack.com/local-testing) with Browserstack.

See the following example for a Linux machine.

First of all, download the linux binary and start your local testing connection:

    $ wget https://www.browserstack.com/browserstack-local/BrowserStackLocal-linux-x64.zip
    $ unzip BrowserStackLocal-linux-x64.zip
    $ ./BrowserStackLocal --key $BROWSERSTACK_ACCESS_KEY & sleep 5

Run your tests. When you are done running your tests, stop your local testing connection (and remove the downloaded binary):

    $ killall BrowserStackLocal
    $  rm -f BrowserStackLocal*

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

The code follows [Ruby Style Guidelines](https://github.com/bbatsov/ruby-style-guide). Run Rubocop to ensure them by executing `bundle exec rubocop`.

Code coverage is automatically generated when rspec is run. A full report can be viewed by opening coverage/index.html (target is > 90%).

### Adding more remote Browserstack browsers

Go to Browserstack [capabilities section for Ruby](https://www.browserstack.com/automate/ruby#configure-capabilities) and select the operating system and browser you would like to add.
Use the capabilities Browserstack provides to start the new browser.

### Testing

Testing of remote Browserstack browsers has been conducted integrating with them directly thanks to the license they provided for this open source project. Thanks!

