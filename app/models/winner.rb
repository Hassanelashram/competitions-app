class Winner < ApplicationRecord
  belongs_to :competition
  belongs_to :participation

  has_one :user, through: :participation
end
