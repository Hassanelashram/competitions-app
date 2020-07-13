class Participation < ApplicationRecord
  monetize :amount_cents
  belongs_to :user
  belongs_to :competition
  has_many :votes
end
