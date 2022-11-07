module Api::V1::Customers
  class ProvidersController < ApiCustomersController
    include CustomerSerializable
    skip_before_action :disable_access_by_tk
    before_action :ensure_params
    before_action :prepare_data, only: :facebook

    # Sign Up/Sign In
    def facebook
      @customer = Customer.find_by_email(@data[:email])
      if @customer.present?
        # Change access token every request
        @customer.generate_access_token unless @customer.access_token
        return set_response(200,
                            'Logueado correctamente',
                            serialize_customer(@customer.reload))
      else
        @customer = Customer.new(@data)
        if @customer.save
          @customer.acquire_access_token!
          return set_response(200,
                              'Usuario creado satisfactorimente',
                              serialize_customer(@customer))
        else
          return set_response(422, @customer.errors.full_messages.to_sentence)
        end
      end
    end

    private
      def user_params
        params.require(:customer).permit(:facebook_access_token)
      end

      def ensure_params
        if params[:customer].present?
          return if params[:customer][:facebook_access_token].present?
        end
        # Need too throw an exception
        set_response(400, 'Error en facebook Access Token!')
      end

      def prepare_data
        level = Level.first
        graph = Koala::Facebook::API.new(user_params[:facebook_access_token])
        user_data = graph.get_object('me?fields=name,first_name,last_name,'\
                                     'email,id,birthday,picture.type(large)')
        
        @data = {
          email: user_data['email'],
          first_name: user_data['first_name'],
          last_name: user_data['last_name'],
          uid: user_data['id'],
          remote_avatar: user_data['picture']['data']['url'],
          provider: 'facebook',
          password: Devise.friendly_token.first(20),
          birthday: user_data['birthday'],
          level: level.name
        }
      end
  end
end
