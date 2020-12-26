class Vote < ApplicationRecord
  belongs_to :participation, foreign_key: 'participation_id', class_name: 'Participation'
  belongs_to :user, optional: true
end
