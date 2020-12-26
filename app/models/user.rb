class User < ApplicationRecord
  has_many :participations
  has_many :votes, through: :participations
  has_many :winners, through: :participations
  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def money_spent
    ids = participations.map {|p| p.competition_id }
    comps = ids.map {|c| Competition.find(c)}
    comps.pluck(:price_cents).sum / 100
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # def money_earned
  #   return "Nothing" Winner.where(use)
  #   ids = participations.map {|p| p.competition_id }
  #   comps = ids.map {|c| Competition.find(c)}
  #   comps.pluck(:price_cents).sum / 100
  # end
end
