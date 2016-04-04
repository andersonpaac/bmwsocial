class ChatsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_socialuname(params[:chat][:handle])
    if @user.nil?
      flash.now[:danger] = "Didn't find a user with that social media email"
      render 'new'
    else
      msp = Message.new()
      msp.handle = params[:chat][:handle]
      msp.content = params[:chat][:content]
      msp.user = @user
      if msp.save
        flash[:success] = "Created"
        redirect_to root_url
      else
        flash.now[:danger] = msp.errors
        render 'new'
      end
    end
  end

  def index
  end

end
