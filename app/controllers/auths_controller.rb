class AuthsController < ApplicationController
  def new
  end

  def index
  end



  def show
    alerts = ['drunk', 'emotion']
    @user = User.where(:id => params[:id]).last
    if @user.nil?
      flash[:danger] = "User not found"
      redirect_to root_url
    else
      flash[:success] = "Your user has been rendered"
      action = Action.where(:social_username => @user.socialuname).last
      @display = {"type" => 'None', "message" => 'None', "destinations" => [] }
      if action.nil?
        @display['type'] = 'None'
      else
        if alerts.index(action.message) != nil
          @display['type'] = 'alert'
          @display['message'] = action.message
        else
          locations = Destination.all
          @display['type'] = 'suggestion'
          @display["destinations"] = populate(locations)
        end
      end
      @display = @display.to_json
    end

  end

  def get
  end

  def create
    strong = getStrong(params[:auth])
    @user = User.new(strong)
    if @user.save
      flash[:info] = "Created"
      redirect_to 'root_url'
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

  def populate(params)
    if params.length == 0
      return []
    end

    retval =[]
    for index in 0..params.length
      diction = {}
      diction['id'] = index+1
      diction['name'] = params[index]['name']
      diction['address'] = params[index]['address']
      retval.push(diction)
    end
  end
