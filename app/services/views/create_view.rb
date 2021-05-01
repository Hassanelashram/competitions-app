module Views
  class CreateView
    def initialize(participation_id, country, ip_address)
      @participation_id = participation_id
      @country = country
      @ip_address = ip_address
    end

    def call
      View.create!(
        participation_id: participation_id,
        country: country,
        ip_address: ip_address
      )
    rescue ActiveRecord::RecordNotUnique => e
      puts e
    end

    private

    attr_accessor :participation_id, :country, :ip_address
  end
end
