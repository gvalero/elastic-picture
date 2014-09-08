require 'rest_client'
class Comment

  include DataMapper::Resource

  belongs_to :picture
  property :id, Serial

  property :title,  String,  :required => true
  property :descr,  Text,    :required => true

  after :create, :to_elastic

  def to_elastic
    response = RestClient.put "#{(ENV['BONSAI_URL'] || 'http://localhost:9200')}/challenge/comments/#{self.id}" , self.to_json(only: [:title, :descr, :picture_id]), :content_type => :json, :accept => :json
      if !response.code.between? 200, 299
        throw :halt
      end

  end



end

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'mysql://root:root@localhost/elastic_picture_development')
DataMapper.auto_upgrade!