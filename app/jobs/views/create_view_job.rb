module Views
  class CreateViewJob < ApplicationJob
    queue_as :default

    def perform(*args)
      View.create!(
        participation_id: args[0],
        country: args[1],
        ip_address: args[2]
      )
    rescue ActiveRecord::RecordNotUnique => e
      puts e
    end
  end
end
