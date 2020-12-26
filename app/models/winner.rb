class Winner < ApplicationRecord
  belongs_to :competition
  belongs_to :participation
end
