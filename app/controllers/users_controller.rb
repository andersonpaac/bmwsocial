class UsersController < ApplicationController
  
  skip_before_filter :verify_authenticity_token  
  
  def associate_twitter_handle
    user_id = params[:userId]
    twitter_handle = params[:twitterHandle]
    twitter_password = params[:twitterPassword]    
    user = User.find_by(id: user_id)
    if user.nil?
      render json: {:status => "error"}, status: 404
    else
      user.socialuname = twitter_handle
      user.socialpwd = twitter_password
      user.save
      render json: {:status => "ok"}, status: 200
    end    
  end
end