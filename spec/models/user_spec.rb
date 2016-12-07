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
  describe "associations" do
    it 'user has favorites' do
      expect(user.favorites).to be_a(ActiveRecord::Associations::CollectionProxy)
    end
    it 'user has songs' do
      expect(user.songs).to be_a(ActiveRecord::Associations::CollectionProxy)
    end
  end
end
