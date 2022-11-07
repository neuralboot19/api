ActiveAdmin.register Level do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :hashed_id, :name, :points
  #
  # or
  #
  # permit_params do
  #   permitted = [:hashed_id, :name, :points]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
