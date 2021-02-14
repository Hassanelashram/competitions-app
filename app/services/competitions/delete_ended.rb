module Competitions
  class DeleteEnded
    def call
      comps = Competition.active.where("end_date < ? ", Time.now)
      comps.each do |c|
        next if c.nil?

        Winner.create!(competition: c, participation: c.winning) unless c.winning.nil?
        c.update(open: false)
      end
    end
  end
end
