class Competition < ApplicationRecord
  monetize :price_cents
  has_many :participations

  scope :active, -> {where(open: true)}


  def winning
    Participation.joins(:votes).where(competition: self.id).order("votes DESC").first
  end

  def ends_in
    days_left = TimeDifference.between(end_date, Time.now).in_days.round
    
    unless days_left == 0
      "Ends in #{days_left} #{'day'.pluralize(days_left)}"
    else
      "Ends Today"
    end
  end
end
