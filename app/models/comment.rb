class Comment

  include DataMapper::Resource

  belongs_to :picture
  property :id, Serial

  property :title, String
  property :descr, Text

end

DataMapper.setup(:default, 'mysql://root:root@localhost/elastic_picture_development')
DataMapper.finalize
DataMapper.auto_upgrade!
