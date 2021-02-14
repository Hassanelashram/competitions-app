desc "Check for competitions that ended"
task close_competitions: :environment do
  Competitions::DeleteEnded.new.call
end
