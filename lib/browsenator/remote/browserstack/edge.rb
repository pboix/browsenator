require 'watir'
require_relative 'browserstack_credentials'
require_relative 'window_size'

module Browsenator
  module Remote
    module Browserstack
      class Edge
        include BrowserstackCredentials
        include WindowSize

        def initialize(opts = {})
          caps = Selenium::WebDriver::Remote::Capabilities.new
          caps['browser'] = 'Edge'
          caps['browser_version'] = opts[:browser_version] || '17.0'
          caps['os'] = 'Windows'
          caps['os_version'] = '10'
          caps['resolution'] = "#{width}x#{height}"
          caps['project'] = opts[:project]
          caps['browserstack.local'] = opts[:local_testing].to_s

          @options = {
            url: "http://#{username}:#{access_key}@hub-cloud.browserstack.com/wd/hub",
            desired_capabilities: caps
          }
        end

        def open
          Watir::Browser.new :remote, options
        end

        private

        attr_reader :options
      end
    end
  end
end
