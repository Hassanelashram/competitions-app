class Participation < ApplicationRecord
  monetize :amount_cents
  belongs_to :user
  belongs_to :competition
  belongs_to :winner, dependent: :destroy, optional: true
  has_many :votes, dependent: :destroy
  has_many :views, dependent: :destroy
  has_one_attached :photo

  ALLOWED_STATES = [
    STATE_PENDING = "pending",
    STATE_CANCELLED = "cancelled",
    STATE_APPROVED = "approved"
  ]

  scope :most_viewed, lambda {
    select("participations.*, COUNT(views.participation_id) as count")
      .joins(:competition)
      .joins(:views)
      .merge(Competition.active)
      .group(:id)
      .order("count desc")
      .limit(3)
  }
end
