module Api::V1
  class ApiController < ActionController::Base
    include Responseable
    include ActionController::MimeResponds
    include ActionController::HttpAuthentication::Token::ControllerMethods
    respond_to :json
    rescue_from Exception, with: :render_internal_server_error
    rescue_from ActiveRecord, with: :render_internal_server_error
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :active_model_errors
    before_action :disable_access_by_tk # , except: :contact
    skip_before_action :verify_authenticity_token

    def cors_default_options_check
      options = request.method == 'OPTIONS'
      headers['Access-Control-Max-Age'] = '1728000' if options
      render json: '' if options
    end

    #def contact
       #ContactMailer.contact_mail(contact_params).deliver
      #set_response(200, 'Tu correo ha sido enviado')
    #end

    def show
      # serializer = serialize_driver(current_user) if current_user.class.name == 'Driver'
      serializer = serialize_customer(current_user) if current_user.class.name == 'Customer'
      set_response(
        200,
        'Usuario listado exitosamente.',
        serializer
      )
    end

    def destroy_session
      if @user.update(access_token: nil)
        render status: 200, json: {
          message: '¡Sesión cerrada exitosamente!',
        }
        return
      end
      set_response(422, 'No se pudo cerrar la sesión')
    end

    def add_mobile_token
      # serializer = serialize_driver(current_user) if current_user.class.name == 'Driver'
      serializer = serialize_customer(current_user) if current_user.class.name == 'Customer'
      if params[:user][:mobile_push_token]
        @user.mobile_push_token = params[:user][:mobile_push_token]
        if @user.save
          set_response(
            200,
            'Mobile Token guardado correctamente',
            serializer
          )
          return
        end
        set_response(422, @user.errors.messages.values.join(', '))
      end
    end

    private
      # def contact_params
        # params.require(:contact).permit(:name, :celular, :email)
      # end

      def current_user
        @user
      end

      def disable_access_by_tk
        authenticate_or_request_with_http_token do |token|
          @user = User.find_by_access_token(token)
          unless @user
            return set_response(404,
                                'Ubicación no encontrada')
          end
          # @user.generate_access_token
          @user
        end
      rescue StandardError => e
        Rails.logger.error e
      end

      def disable_access_by_approved_status
        return set_response(401,
                            'Usuario no activo en la plataforma') unless @user.approved?
      end

      def find_by_token(token)
        @user = Customer.find_by(access_token: token) # || Driver.find_by(access_token: token)
      end

      def render_internal_server_error(exception)
        Rails.logger.error("ERROR en la llamada a la API: #{exception.message}")
        Rails.logger.error(exception.backtrace.join("\n"))
        set_response(500, exception.message)
      end

      def render_unauthorized
        return set_response(401, 'Correo o contraseña invalidos.')
      end

      def render_forbidden
        return set_response(403, 'Acceso Prohibido')
      end

      def record_not_found
        return set_response(404, 'Sitio no encontrado')
      end

      def active_model_errors(exception)
        return set_response(400, exception.record.errors.full_messages)
      end

  end
end
