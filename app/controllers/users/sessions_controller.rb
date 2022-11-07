# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

   #GET /resource/sign_in
   def new
     super
   end

   #POST /resource/sign_in
   def create
     user = User.where(email: params[:user][:email]).first
     redirect_to admin_root_path and return unless user.type == "Administrator"
     super
   end

   #DELETE /resource/sign_out
   def destroy
     super
   end

   protected

   #If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :first_name, :last_name, :role])
   end
end
