class SurveysUser < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :survey
  belongs_to :user
end
