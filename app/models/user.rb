require 'dm-validations'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String, required: true
  property :email,    String, unique: true, format: :email_address, required: true
  property :password, BCryptHash, length: 255
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  has n, :links, through: Resource
end
