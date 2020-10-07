require 'rails_helper'
require 'capybara/rspec'
require 'spec_helper'

RSpec.describe User, type: :model do
  context 'Testing Event model' do
    it 'Should be valid if creating event' do
      expect(User.new(name: 'Hellllo', username: 'Testfdfd', email: 'helloworld@gmail.com', password: '123456', password_confirmation: '123456')).to be_valid
    end

    it 'Shouldn´t save if the name is less than 5 or more than 25 characters' do
      user = User.new(name: 'Helo', username: 'Test', email: 'helloworld@gmail.com', password: '123456', password_confirmation: '123456')
      expect(user.save).to eq(false)
    end

    it 'Shouldn´t save if the username is less than 5 or more than 15 characters' do
      user = User.new(name: 'Helo', username: 'Test', email: 'helloworld@gmail.com', password: '123456', password_confirmation: '123456')
      expect(user.save).to eq(false)
    end

    it 'Shouldn´t save if the email if is invalid' do
      user = User.new(name: 'Helo', username: 'Test', email: 'helloworldgmail', password: '123456', password_confirmation: '123456')
      expect(user.save).to eq(false)
    end

    it 'Password should contain more than 6 characters' do
      user = User.new(name: 'Helo', username: 'Test', email: 'helloworldgmail', password: '1234', password_confirmation: '1234')
      expect(user.save).to eq(false)
    end
  end
end
