module Api::V1::Customer
  class OptionSerializer
    include FastJsonapi::ObjectSerializer
    attributes :hashed_id,
               :operation, :result, :show

  end
end
