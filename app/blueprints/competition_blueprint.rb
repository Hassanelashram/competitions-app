class CompetitionBlueprint < Blueprinter::Base
    identifier :id

    view :normal do
      fields :name, :image, :award, :max_entries, :end_date
      field :price do |object|
        object.price_cents / 100
      end

      association :participations, blueprint: ParticipationBlueprint
    end
  end