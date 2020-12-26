class DeleteCompetitionsJob < ApplicationJob
  queue_as :default

  def perform
    comps = Competition.active
    comps = comps.where("end_date < ? ", Time.now)
    comps.each do |c|
      if !c.nil?
        Winner.create!(competition: c, participation: c.winning)
        c.update(open: false)
      end
    end
  end
end
