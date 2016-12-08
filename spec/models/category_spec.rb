require 'rails_helper'

describe Category do
  let(:category) { Category.new }

  describe "validations" do
    it 'has to have a name' do
      expect(category.invalid?).to be_truthy
      category.name = 'hello'
      expect(category.valid?).to be_truthy
    end
  end

  # missing tests for associations
end
