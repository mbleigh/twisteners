class UsersController < ApplicationController
  def show
    @listeners = user.listeners.by_count.all(:limit => 25)
  end
  
  def tweet_my_top
    top3 = current_user.listeners.by_count.all(:limit => 3).collect{|l| "@#{l.screen_name}"}
    message = "My top 3 listeners are #{top3.to_sentence}. #{user_url(current_user)}"
    @tweet = current_user.twitter.post('/statuses/update.json', :status => message)    
  end
  
  protected
  
  def user
    @user ||= User.from_param(params[:id])
  end
  helper_method :user
end
