FactoryBot.define do
    factory :winner do
      participation { build(:participation) }
      competition { build(:competition) }
    end
  end