RSpec.describe Exchanger::Account do 
  let(:user_class) { Struct.new(:name, :surname) }
  let(:allen) { described_class.new(user_class.new('Allen', 'Rails')) }
  let(:kirill) { described_class.new(user_class.new('Kirill', 'Rails')) }

  it 'has zero balance' do 
    expect(allen.balance).to eq(0)
  end

  fit 'has proiperty uid' do
    expect(allen.uid).to be_an_instance_of(String)
  end

  fdescribe "#deposit" do 
    it 'allows to deposit correct sum' do 
      kirill.deposit 30 
      expect(kirill.balance).to eq(30)
    end

    it 'does not allow to deposit a negative sum' do 
      expect { kirill.deposit -200 }.to raise_error(Exchanger::IncorrectSum, /Amount must be positive!/)
    end

    it 'does not allow to deposit a zero sum' do 
      expect { kirill.deposit 0 }.to raise_error(Exchanger::IncorrectSum, /Amount must be positive!/)
    end
  end

  context 'when performing money withdrawal' do 
    before { allen.deposit 300 }

    specify "#transfer" do 
      expect(kirill.balance).to eq(0)

      allen.transfer kirill, 200
      expect(allen.balance).to eq(100)
      expect(kirill.balance).to eq(200)
    end

    describe "#withdraw" do 
      it 'allows to withdraw correct sum' do 
        allen.withdraw 100
        expect(allen.balance).to eq(200)
      end

      it 'does not allow to withdraw a sum that is too large' do 
        expect { allen.withdraw 500 }.to raise_error(Exchanger::NotEnoughMoney, /Available: 300/)
      end

      it 'does not allow to withdraw a negative sum' do 
        expect { allen.withdraw -500 }.to raise_error(Exchanger::IncorrectSum, /must be positive!/)
      end

      it 'does not allow to withdraw a zero sum' do 
        expect { allen.withdraw 0 }.to raise_error(Exchanger::IncorrectSum, /must be positive!/)
      end
    end
  end
end
