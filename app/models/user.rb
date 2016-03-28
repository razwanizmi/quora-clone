class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true
  validates :full_name, :presence => true
  validates :password, :presence => true
  validates_format_of :email, :with => /[^@\s]+[@]+[^@\s]+[.]+[^@\s]+/, :on => :create, message: "User email is not in proper format"
  validates_length_of :password, minimum: 5, message: "Password must be more than 5 characters"
  has_secure_password
end