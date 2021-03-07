ActiveAdmin.register Competition do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :price_cents, :rule, :image, :award, :max_entries, :end_date, :open, :category
  #
  # or
  #
  index do
    column :id
    column :name
    column :price_cents
    column :award
    column :max_entries
    column :end_date
    column :open
    column :category
    actions
  end
  
end
