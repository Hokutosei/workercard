class User < ActiveRecord::Base
  attr_accessible :edit, :email, :username, :password, :password_confirmation

  acts_as_authentic
end
