class AssignmentAchieved < ApplicationRecord
  include Hashable

  belongs_to :user
	belongs_to :achievement
end
