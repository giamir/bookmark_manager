class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password, BCryptHash, length: 250

  has n, :links, through: Resource
end
