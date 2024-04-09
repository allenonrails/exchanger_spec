RSpec.describe Exchanger::Utils::Uid do 
  let(:uid_class) { Class.new { include Exchanger::Utils::Uid }.new }

  describe "#get_hash" do 
    it 'returns nil when no args were given' do 
      expect(uid_class.get_hash).to be_nil
    end

    it 'returns string when at least 1 arg was given' do 
      expect(uid_class.get_hash 'str', 'val2').to be_an_instance_of(String)
    end
  end
end
