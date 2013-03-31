class UserSessionsController < ApplicationController
  respond_to :json
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    p "this user session #{@user_session}"
    if @user_session.save
      respond_with @user_session
    else
      @message = 'not logged in'
      respond_with @message
      #render :action => :new
    end
  end

  def destroy
    @user_session = UserSession.find
    p "user dest #{@user_session.inspect}"
    @user_session.destroy
    respond_with @user_session

    #@user_session.destroy
    #flash[:notice] = "Successfully logged out."
    #redirect_to root_url
  end



end