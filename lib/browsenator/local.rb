require_relative 'local/chrome'
require_relative 'local/firefox'
require_relative 'local/safari'

module Browsenator
  module Local
    def self.for(browser, opts = {})
      case browser
      when :chrome
        Chrome.new(opts).open
      when :firefox
        Firefox.new(opts).open
      when :safari
        Safari.new.open
      else
        raise ArgumentError, "Unknown local browser: #{browser.inspect}"
      end
    end
  end
end
