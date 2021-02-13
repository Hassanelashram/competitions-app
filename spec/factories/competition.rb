FactoryBot.define do
    factory :competition do
      name { Faker::Space.planet }
      price_cents { rand(100..300) }
      rule { "no rule" }
      award { rand(30..50) }
      image { "image_link" }
      max_entries { rand(20..50) }
      end_date { Date.today + 1 }
      open { true }
      category { Competition::ALLOWED_CATEGORIES.sample }
    end
  end