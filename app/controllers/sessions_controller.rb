class SessionsController < ApplicationController
  def new
    redirect_to('/') if current_user
  end

  def create
    #ldap_user = Adauth.authenticate(params[:username], params[:password])
    #if ldap_user
    #   	user = User.create_user_with_adauth(ldap_user)
    #     user.update_from_adauth(ldap_user)
    #   	session[:user_id] = user.id
    #   	redirect_to '/'
    #else
    #   	redirect_to '/sessions/new', :error => "Invalid Login"
    #end
    if(params[:username].eql?("IteraConsulting") && params[:password].eql?("ViSkalSelge"))
      user = create_user
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/sessions/new', :error => "Invalid Login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end

  def create_user
    user = User.new
    user.login = ["IteraConsulting"]
    user.name =  ["IteraConsulting"]
    user.save
    user
  end
end