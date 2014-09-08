class Comment

  include DataMapper::Resource

  belongs_to :picture
  property :id, Serial

  property :title, String
  property :descr, Text

end

DataMapper.setup(:default, 'mysql://b1feb65f685d9a:ad773aef@eu-cdbr-west-01.cleardb.com/heroku_7ce8bf61a79d9e0?reconnect=true')
DataMapper.auto_upgrade!