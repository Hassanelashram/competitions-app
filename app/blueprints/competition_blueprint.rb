class CompetitionBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :name, :image, :award, :max_entries
    field :price do |object|
      object.price_cents / 100
    end

    field :end_date, &:ends_in

    association :participations, blueprint: ParticipationBlueprint
  end
end
