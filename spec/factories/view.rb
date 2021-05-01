FactoryBot.define do
  factory :view do
    participation { build(:participation) }
    country { "CH" }
    ip_address { "#{rand(100.200)}.#{rand(100.200)}.#{rand(100.200)}" }
  end
end
