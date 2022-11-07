class Operation < ApplicationRecord
  include Hashable

  # enum type_operation: ENV['TYPES'].split(/,/)
end
