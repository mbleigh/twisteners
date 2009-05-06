class Listener < ActiveRecord::Base
  belongs_to :user
  
  named_scope :by_count, :order => "count DESC"
  
  def self.create_from_mention(user, mention)
    create(:user => user,
           :screen_name => mention['user']['screen_name'],
           :profile_image_url => mention['user']['profile_image_url'])
  end
end
