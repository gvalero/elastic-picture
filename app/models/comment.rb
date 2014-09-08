class Comment

  include DataMapper::Resource

  belongs_to :picture
  property :id, Serial

  property :title, String
  property :descr, Text

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'mysql://user:password@hostname/database')
DataMapper.auto_upgrade!