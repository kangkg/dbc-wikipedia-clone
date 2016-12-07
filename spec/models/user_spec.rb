require 'rails_helper'

describe User do
  let(:user) { User.new }

  describe "validations" do
    it 'has to have a username and password' do
      expect(user.invalid?).to be_truthy
      user.username = 'hello'
      user.password = 'password'
      expect(user.invalid?).to be_falsey
    end
  end

end
