class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :surveys
  has_many :choices_users
  has_many :surveys_users
end
