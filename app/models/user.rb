require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password, BCryptHash, length: 255
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  has n, :links, through: Resource
end
