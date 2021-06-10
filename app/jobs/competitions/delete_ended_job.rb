module Competitions
  class DeleteEndedJob < ApplicationJob
    def perform
      Competitions::DeleteEnded.new.call
    end
  end
end
