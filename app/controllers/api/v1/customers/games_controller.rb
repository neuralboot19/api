module Api::V1::Customers
  class GamesController < ApiCustomersController

    def index
      games = Game.where(show: true)
      return set_response(200,
                           'Juegos encontrado satisfactorimente',
                           serialize_game(games)) if games.present?
      return set_response(401,
                           'No existen Juegos') unless games.present?
    end

    def show
      game = Game.where(id: params[:id], show: true)
      return set_response(200,
                           'Juego encontrado satisfactorimente',
                           serialize_game(game)) if game.present?
      return set_response(401,
                           'No existe el Juego') unless game.present?
    end

  end
end
