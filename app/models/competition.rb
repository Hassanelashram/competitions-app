class Competition < ApplicationRecord
  monetize :price_cents
  has_many :participations
end
