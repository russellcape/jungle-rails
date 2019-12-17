require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should create user' do
      @user = User.create(
        first_name: "Russell",
        last_name: "Cape",
        email: "russell123@example.com",
        password: "ABC",
        password_confirmation: "ABC"
        )
      expect(@user).to (be_valid)
    end

    it 'should have password and password confirmation' do
      @user = User.create(
        first_name: "Russell",
        last_name: "Cape",
        email: "russell@example.com",
        password: "ABC",
        password_confirmation: nil
        )
      expect(@user.password_confirmation).to_not be_equal(@user)
    end

    it 'should have matching password and password confirmation' do
      password = User.create(
        first_name: "Russell",
        last_name: "Cape",
        email: "russell@example.com",
        password: "ABC",
        password_confirmation: "CBA"
        )
      expect(password.password_confirmation).to_not be_equal(password)
    end

    it 'should not save without unique email' do
      @user1 = User.create(
        first_name: "Russell",
        last_name: "Cape",
        email: "russell@example.com",
        password_digest: "ABC"
        )
      @user2 = User.create(
        first_name: "Russell",
        last_name: "Cape",
        email: "RUSSELL@example.com",
        password_digest: "ABC"
        )
    expect(@user1.email).to_not be_equal(@user2)
    end

    it 'should have first name to be a valid user' do
      @user = User.create(
        first_name: nil,
        last_name: "Cape",
        email: "russell@example.com",
        password: "ABC",
        password_confirmation: "ABC"
        )
      expect(@user).to_not be_equal(@user.first_name)
    end

    it 'should have last name to be a valid user' do
      @user = User.create(
        first_name: "Russell",
        last_name: nil,
        email: "russell@example.com",
        password: "ABC",
        password_confirmation: "ABC"
        )
      expect(@user).to_not be_equal(@user.last_name)
    end

    it 'should have a password with a minimum length of 3' do
      @user = User.create(
        first_name: "Russell",
        last_name: "Cape",
        email: "russell@example.com",
        password: "ABC",
        password_confirmation: "ABC"
        )
      expect(@user.password.length).to be_equal(3)
    end
  end

  describe '.authenticate_with_credentials' do
    
    it 'should pass with valid credentials' do
      @user = User.create(
        first_name: "Russell",
        last_name: "Cape",
        email: "russell@example.com",
        password: "ABC",
        password_confirmation: "ABC"
      )
      @user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@user).to_not (be_valid)
    end