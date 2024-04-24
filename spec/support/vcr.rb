require 'vcr'

VCR.configure do |c|
  c.ignore_hosts 'log.host'
  c.hook_into :webmock
  c.default_cassette_options = {
    decode_compressed_response: true
  }
  c.cassette_library_dir = File.join(
    File.dirname(__FILE__), '..', 'fixtures', 'vcr_cassettes'
  )
  c.filter_sensitive_data("<LOCALISE_API_TOKEN>") {
    ENV.fetch('API_TOKEN', 'hidden')
  }
end
