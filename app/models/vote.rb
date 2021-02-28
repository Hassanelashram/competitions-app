class Vote < ApplicationRecord
  belongs_to :participation, foreign_key: 'participation_id', class_name: 'Participation'
  belongs_to :user, optional: true
  validates :email, presence: true
  validates_uniqueness_of :email
  validate :no_self_vote

  scope :verified, -> { where(verified: true) }

  def no_self_vote
    return unless participation.user.email == email

    errors.add(email: "You cannot vote for yourself")
  end
end
