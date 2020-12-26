class Participation < ApplicationRecord
  monetize :amount_cents
  belongs_to :user
  belongs_to :competition
  has_many :votes, dependent: :destroy
  has_one_attached :photo
  belongs_to :winner, dependent: :destroy, optional: true
end
