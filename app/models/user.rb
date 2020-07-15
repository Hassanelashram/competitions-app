class User < ApplicationRecord
  has_many :participations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def votes_received
    all_votes = self.participations.map { |p| p.votes.count }
    return all_votes.sum
  end
end
