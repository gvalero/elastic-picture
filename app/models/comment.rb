require 'rest_client'
class Comment

  include DataMapper::Resource

  belongs_to :picture
  property :id, Serial

  property :title,  String,  :required => true
  property :descr,  Text,    :required => true

  after :create, :to_elastic

  def to_elastic
    response = RestClient.put ("https://3pp2ukiw:z4itm7dd9bs9ove2@aralia-4767553.eu-west-1.bonsai.io/challenge/comments/#{self.id}") , self.to_json(only: [:title, :descr, :picture_id]), :content_type => :json, :accept => :json
    if !response.code.between? 200, 299
      throw :halt
    end
  end



end

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'mysql://root:root@localhost/elastic_picture_development')
DataMapper.auto_upgrade!