require 'data_mapper'
require 'dm-postgres-adapter'

RACK_ENV= ENV['RACK_ENV']

class Link

  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :url, String

end

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{RACK_ENV}")
DataMapper.finalize
DataMapper.auto_upgrade!
