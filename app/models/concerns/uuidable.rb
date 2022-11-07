module Uuidable
  extend ActiveSupport::Concern

  def generate_uuid
    BSON::ObjectId.new.to_s
  end

  included do
    before_create { self.uuid = generate_uuid }
  end
end

