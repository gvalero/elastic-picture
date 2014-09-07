class Comment

  include DataMapper::Resource

  belongs_to :picture
  property :id, Serial

  property :title, String
  property :descr, Text

end