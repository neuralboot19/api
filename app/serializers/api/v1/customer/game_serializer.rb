module Api::V1::Customer
  class GameSerializer
    include FastJsonapi::ObjectSerializer
    attributes :title,
               :hashed_id, :img, :show

  end
end
