class UserSessionsController < ApplicationController
  respond_to :json
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    p @user_session.inspect
    if @user_session.save
      p "user #{@user_session}"
      respond_with @user_session
    else
      render :action => :new
    end
  end

  def destroy
    #current_user_session.destroy
    @user_session = UserSession.find
    p "this user session #{@user_session}"
    @user_session.destroy
    respond_with @user_session

    #@user_session.destroy
    #flash[:notice] = "Successfully logged out."
    #redirect_to root_url
  end



end