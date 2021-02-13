FactoryBot.define do
    factory :participation do
      user { build(:user) }
      competition { build(:competition) }
      image { "image_link" }
    end
  end