ActiveAdmin.register Participation do
  permit_params :state


  form do |f|
    f.input :state, as: :select, collection: Participation::ALLOWED_STATES
  end
  
end
