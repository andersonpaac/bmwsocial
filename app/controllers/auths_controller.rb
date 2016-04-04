class AuthsController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def get
  end

  def create
    strong = getStrong(params[:auth])
    @user = User.new(strong)
    if @user.save
      flash[:info] = "Created"
      redirect_to root_url
    else
      flash.now[:danger] = @user.errors
      render 'new'
    end
  end

end
#{:name=>"asAD", :email=>"LOL@lmail.com", :socialuname=>"andersonpaac@gmail.com", :socialpwd=>"safepassword"}

private
  def getStrong(parameters)
    strong = {}
    strong[:name] = parameters[:name]
    strong[:email] = parameters[:email]
    strong[:socialuname] = parameters[:socialuname]
    strong[:socialpwd] = parameters[:socialpwd]
    strong
  end