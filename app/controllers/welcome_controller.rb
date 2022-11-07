class WelcomeController < ApplicationController

  def privacy
    render status: :ok, json: {message: 'OK'}
  end

end
