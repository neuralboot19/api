class Achievement < ApplicationRecord
  include Hashable

  has_many :assignment_achieveds
end
