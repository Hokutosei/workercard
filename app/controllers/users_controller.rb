class UsersController < ApplicationController
  respond_to :html, :json

  def index
    @user = User.find(params[:id])
    respond_with @user
  end

end
