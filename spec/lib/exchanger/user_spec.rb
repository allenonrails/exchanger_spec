RSpec.describe Exchanger::User do 
  let(:user) { described_class.new 'Allen', 'Rails'}
  let(:user_no_name) { described_class.new nil, 'Rails'}

  it 'returns name' do 
    expect(user.name).to eq('Allen')
  end

  it 'return name as a string' do 
    expect(user_no_name.name).to be_an_instance_of(String)
  end

  it 'returns surname' do 
    expect(user.surname).to eq('Rails')
  end

  it 'returns full_name' do 
    expect(user.full_name).to eq('Allen Rails')
  end
end
