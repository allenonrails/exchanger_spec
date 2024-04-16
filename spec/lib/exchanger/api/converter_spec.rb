RSpec.describe Exchanger::Api::Converter do 
  specify "#convert" do 
    converter_stub = instance_double 'Exchanger::Api::Converter'

    allow(converter_stub).to receive(:convert).with(sum: 100).and_return(50)

    expect(converter_stub.convert(sum: 100)).to eq(50)

    expect(converter_stub).to have_received(:convert).with(sum: 100).once
  end
end
