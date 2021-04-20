class Referral < ApplicationRecord
    belongs_to :referrer, class_name: "User", foreign_key: :referrer
    belongs_to :referred, class_name: "User", foreign_key: :referred

    
end
