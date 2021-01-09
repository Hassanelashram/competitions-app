module Competitions
class DeleteEnded
    def call
      comps = Competition.active.where("end_date < ? ", Time.now)
      comps.each do |c|
        if !c.nil?
          unless c.winning.nil?
            Winner.create!(competition: c, participation: c.winning)
          end
          c.update(open: false)
        end
      end
    end
  end
end