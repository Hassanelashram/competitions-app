class User < ApplicationRecord
  has_many :participations
  has_many :winners, through: :participations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def votes_received
    all_votes = self.participations.map { |p| p.votes.count }
    return all_votes.sum
  end

  def money_spent
    ids = participations.map {|p| p.competition_id }
    comps = ids.map {|c| Competition.find(c)}
    comps.pluck(:price_cents).sum / 100
  end

  # def money_earned
  #   return "Nothing" Winner.where(use)
  #   ids = participations.map {|p| p.competition_id }
  #   comps = ids.map {|c| Competition.find(c)}
  #   comps.pluck(:price_cents).sum / 100
  # end
end
