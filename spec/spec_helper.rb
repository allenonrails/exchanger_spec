require 'webmock/rspec'
require_relative '../lib/exchanger'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |c|
  c.example_status_persistence_file_path = 'spec/specs.txt'

  WebMock.allow_net_connect!

  WebMock::API.prepend(Module.new do
    extend self

    def stub_request(*args)
      VCR.turn_off!
      super
    end
  end)

  c.before { VCR.turn_on! }
end

