class User < ApplicationRecord
  has_many :participations
  has_many :competitions, through: :participations
  has_many :votes, through: :participations
  has_many :views, through: :participations
  has_many :winners, through: :competitions
  has_many :referral_made, foreign_key: :referrer_id, class_name: "Referral"
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook] # remove google because of some strange error

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.image = auth.info.image
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def participations_of_referrals
    Participation.where(user: referral_made)
  end

  def admin?
    admin == true
  end

  def money_earned
    ids = Winner.joins(:participation).where("participations.user_id = #{id}").pluck(:competition_id)
    Competition.where(id: ids).pluck(:award).sum
  end

  def money_spent
    participations.pluck(:amount_cents).sum / 100
  end

  def total_views
    View.where(participation: participations).count
  end

  def recommendations
    return Participation.none if participations.empty?

    names = competitions.pluck(:name)
    categories = competitions.pluck(:category)
    competitions = Competition.active.where("name similar to '(#{names})%'")
                              .or(Competition.active.where(category: categories))

    competitions.where.not(id: self.competitions)
  end
end
