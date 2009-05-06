class User < TwitterAuth::GenericUser
  has_many :listeners
  
  after_create :update_listeners! # hacky
  
  def update_listeners!
    mentions = self.twitter.get("/statuses/replies.json?since_id=#{self.last_processed_id}&count=500")
    
    return update_attributes(:last_processed_at => Time.now) if mentions.empty?
    
    mentions.each do |m|
      listener = Listener.find_by_screen_name(m['user']['screen_name']) || Listener.create_from_mention(self, m)      
      listener.increment!(:count)
    end
    
    update_attributes(:last_processed_at => Time.now, :last_processed_id => mentions.first['id'])
  end
  
  def self.from_param(parameter)
    find_by_login(parameter)
  end
  
  def to_param
    login
  end
end
