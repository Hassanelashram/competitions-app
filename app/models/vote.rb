class Vote < ApplicationRecord
  belongs_to :participation
  belongs_to :user, optional: true
  validates :email, presence: true, uniqueness: true
end
