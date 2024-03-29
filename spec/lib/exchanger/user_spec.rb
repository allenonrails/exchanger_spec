RSpec.describe Exchanger::User do 
  it 'returns name' do 
    user = Exchanger::User.new 'Allen', 'Rails'
    expect(user.name).to eq('Allen')
  end
end
