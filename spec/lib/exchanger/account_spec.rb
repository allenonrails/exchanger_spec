RSpec.describe Exchanger::Account do 
  let(:user_class) { Struct.new(:name, :surname) }
  let(:allen) { described_class.new(user_class.new('Allen', 'Rails')) }

  it 'has zero balance' do 
    expect(allen.balance).to eq(0)
  end

  it 'has proiperty uid' do 
    expect(allen.uid).to be_an_instance_of(String)
  end
end
