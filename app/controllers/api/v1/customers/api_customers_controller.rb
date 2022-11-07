module Api::V1::Customers
  class ApiCustomersController < Api::V1::ApiController
    include CustomerSerializable
    before_action :validate_user_permission, except: [:facebook]

    def validate_user_permission
      return set_response(401, 'Sitio no encontrado') unless @user.class.name == 'Customer'
    end
  end
end
