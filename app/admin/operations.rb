ActiveAdmin.register Operation do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :hashed_id, :type_operation, :operation, :result, :title, :id_url_video_youtube, :help, :point, :show
  #
  # or
  #
  # permit_params do
  #   permitted = [:hashed_id, :type_operation, :operation, :result, :title, :id_url_video_youtube, :help, :point, :show]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
