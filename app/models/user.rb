class User < ActiveRecord::Base
  attr_accessible :edit, :email, :username, :password, :password_confirmation, :created_at, :updated_at

  acts_as_authentic
end
