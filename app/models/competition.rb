class Competition < ApplicationRecord
  monetize :price_cents
  has_many :participations

  scope :active, -> {where(open: true)}


  def winning
    Participation.joins(:votes).where(competition: self.id).order("votes DESC").first
  end
#@users.joins(:learning_subjects).where.not(learning_subjects: { id: nil }).distinct
  def ends_in
    days_left = self.end_date.day - Time.now.day
    unless days_left == 0
      "Ends in #{days_left} #{'day'.pluralize(days_left)}"
    else
      "Ends Today"
    end
  end
end
