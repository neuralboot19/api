module Api::V1::Customers
  class OptionsController < ApiCustomersController

    def index
      options = Option.where(show: true).shuffle
      
      return set_response(401, 'No existen Opciones') unless options.present?
      return set_response(200, 'Opciones encontradas satisfactorimente', serialize_option(options.take(3)))
    end

  end
end
