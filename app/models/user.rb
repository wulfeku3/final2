class User < ActiveRecord::Base

  validates_uniqueness_of :email, :message => "Sorry, this email is already registered. Please use another."
  has_secure_password

end