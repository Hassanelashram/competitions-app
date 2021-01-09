desc "Check for competitions that ended"
task :close_competitions do
    Competitions::DeleteEnded.new.call
end