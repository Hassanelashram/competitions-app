module Competitions
    class DeleteEnded < ApplicationJob
        def perform
            Competitions::DeleteEnded.new.call
        end
    end
end