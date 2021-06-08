module Views
  class CreateViewJob < ApplicationJob
    queue_as :default

    def perform(participation_id, country, ip_address)
      Views::CreateView.new(participation_id, country, ip_address).call
    end
  end
end
