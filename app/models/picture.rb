class Picture

  include DataMapper::Resource
  include Paperclip::Resource

  has n, :comments
  property :id, Serial

  property :title,  String,   :required => true
  property :descr,  Text,     :required => true
  #property :path,   FilePath
  #property :md5sum, String,   :length => 32, :default => lambda { |r, p| Digest::MD5.hexdigest(r.path.read) if r.path }
  #property :created_at, DateTime

  has_attached_file :image, :styles => {:medium => "300x300", :thumb => "100x100"}
end

DataMapper.setup(:default, 'mysql://b1feb65f685d9a:ad773aef@eu-cdbr-west-01.cleardb.com/heroku_7ce8bf61a79d9e0?reconnect=true')
DataMapper.auto_upgrade!
