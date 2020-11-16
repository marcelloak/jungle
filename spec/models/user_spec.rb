require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'creates if all validations are met' do
      @user = User.create!(first_name: 'First', last_name: 'Last', email: 'email@email.com', password: 'password', password_confirmation: 'password')
    end

    it 'fails if first name validation is not met' do
      @user = User.create(last_name: 'Last', email: 'email@email.com', password: 'password', password_confirmation: 'password')
      expect(@user.errors.full_messages).to be_include("First name can't be blank")
    end

    it 'fails if last name validation is not met' do
      @user = User.create(first_name: 'First', email: 'email@email.com', password: 'password', password_confirmation: 'password')
      expect(@user.errors.full_messages).to be_include("Last name can't be blank")
    end

    it 'fails if email is not set' do
      @user = User.create(first_name: 'First', last_name: 'Last', password: 'password', password_confirmation: 'password')
      expect(@user.errors.full_messages).to be_include("Email can't be blank")
    end

    it 'fails if email is in database already' do
      @user = User.create(first_name: 'First', last_name: 'Last', email: 'email@email.com', password: 'password', password_confirmation: 'password')
      @user2 = User.create(first_name: 'Second', last_name: 'SecondLast', email: 'EMAIL@EMAIL.com', password: 'password', password_confirmation: 'password')
      expect(@user2.errors.full_messages).to be_include("Email has already been taken")
    end

    it 'fails if password is not set' do
      @user = User.create(first_name: 'First', last_name: 'Last', email: 'email@email.com', password_confirmation: 'password')
      expect(@user.errors.full_messages).to be_include("Password can't be blank")
    end

    it 'fails if password confirmation is not set' do
      @user = User.create(first_name: 'First', last_name: 'Last', email: 'email@email.com', password: 'password')
      expect(@user.errors.full_messages).to be_include("Password confirmation can't be blank")
    end

    it 'fails if password and password confirmation are not the same' do
      @user = User.create(first_name: 'First', last_name: 'Last', email: 'email@email.com', password: 'password', password_confirmation: 'password2')
      expect(@user.errors.full_messages).to be_include("Password confirmation doesn't match Password")
    end

    it 'fails if password is too short' do
      @user = User.create(first_name: 'First', last_name: 'Last', email: 'email@email.com', password: 'pas', password_confirmation: 'pas')
      expect(@user.errors.full_messages).to be_include("Password is too short (minimum is 4 characters)")
    end
  end
end
