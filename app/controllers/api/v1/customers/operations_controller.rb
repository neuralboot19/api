module Api::V1::Customers
  class OperationsController < ApiCustomersController

    def index
      operations = Operation.where(show: true)
      offset = rand(operations.count)
      rand_record = operations.offset(offset).first

      return set_response(401, 'No existe la Operación') unless rand_record.present?
      return set_response(200, 'Operación encontrada satisfactorimente', serialize_operation(rand_record))
    end

  end
end
