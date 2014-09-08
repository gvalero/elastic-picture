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

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'mysql://user:password@hostname/database')
DataMapper.auto_upgrade!
