module Responseable
  extend ActiveSupport::Concern

  def set_response(status, message, data = "{\"data\":{}}", total_pages = 0)
    current_user ||= @customer || @user
    response.headers['X-Total-Pages'] = total_pages
    response.headers['HTTP_AUTHORIZATION'] = current_user ? current_user.access_token : nil
    render status: status, json: {
      message: message,
      info: JSON.parse(data)
    }
  end
end

