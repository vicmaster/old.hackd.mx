require 'spec_helper'

describe User do
  describe '#create_with_omniauth' do
    let(:auth) do
      { 'info' => { 'uid' => '123432',
                    'email' => 'test@example.com',
                    'nickname' => 'foobar'
                  }
      }
    end

    it 'creates a user with the omniauth callback information' do
      expect{ User.create_with_omniauth auth }.to_not raise_error
    end
  end
end
