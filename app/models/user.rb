class User < ApplicationRecord
  has_many :participations
  has_many :competitions, through: :participations
  has_many :votes, through: :participations
  has_many :winners, through: :competitions
  validates :first_name, :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    admin == true
  end

  def money_earned
    ids = Winner.joins(:participation).where("participations.user_id = #{self.id}").pluck(:competition_id)
    Competition.where(id: ids).pluck(:award).sum
  end

  def money_spent
    competitions.pluck(:price_cents).sum / 100
  end

  def total_views
    View.where(participation: participations).count
  end
end
