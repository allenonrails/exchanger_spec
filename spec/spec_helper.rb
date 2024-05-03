require_relative '../lib/exchanger'

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/specs.txt'

  config.define_derived_metadata(file_path: /exchanger\/utils/) do |meta|
    meta[:fast] = true
  end
end
