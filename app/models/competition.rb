class Competition < ApplicationRecord
  monetize :price_cents
  has_many :participations

  scope :active, -> { where(open: true) }

  validates :name, :price, :image, :rule, :award, :max_entries,
            :end_date, :category, presence: true

  ALLOWED_CATEGORIES = [
    TATTOO = "Tattoo",
    FUNNY = "Funny",
    BEAUTY = "Beauty",
    WRITING = "Writing",
    CODING = "Coding"
  ].freeze

  def winning
    return nil if participations.empty?
    return nil if participations.joins(:votes).empty?

    participations.joins(:votes).order("votes DESC").first
  end

  def self.category_count(category)
    where(category: category).active.count
  end

  def ends_in
    days_left = TimeDifference.between(end_date, Time.now).in_days.round
    if days_left <= 1
      hours_left = TimeDifference.between(end_date, Time.now).in_hours.round
      if hours_left <= 1
        minutes_left = TimeDifference.between(end_date, Time.now).in_minutes.round
        return "Ends in #{minutes_left} #{'minute'.pluralize(minutes_left)}"
      end
      return "Ends in #{hours_left} #{'hour'.pluralize(hours_left)}"
    end

    "Ends in #{days_left} #{'day'.pluralize(days_left)}"
  end

  def recommendations
    Competition.active.where("(name ILIKE ? AND category = ?) OR (name ILIKE ?) OR (category = ?)",
                             name, category, name, category).limit(3)
  end
end
