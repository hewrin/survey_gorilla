class Choice < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :questions
  has_many :choices_users
  has_many :surveys_users
end
