class ChatsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_socialuname(params[:chat][:sender])
    if @user.nil?
      flash.now[:danger] = "Didn't find a user with that social media email"
      render 'new'
    else
      flash.now[:success] = "Created"
      redirect_to root_url
    end

  end

  def index
  end

end
