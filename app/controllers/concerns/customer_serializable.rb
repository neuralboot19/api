module CustomerSerializable
  extend ActiveSupport::Concern

  def serialize_customer(customer)
    Api::V1::Customer::CustomerSerializer.new(customer).serialized_json
  end

  def serialize_game(game)
    Api::V1::Customer::GameSerializer.new(game).serialized_json
  end

  def serialize_operation(operation)
    Api::V1::Customer::OperationSerializer.new(operation).serialized_json
  end

  def serialize_option(option)
    Api::V1::Customer::OptionSerializer.new(option).serialized_json
  end

end
