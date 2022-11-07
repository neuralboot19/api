module Api::V1::Customer
  class OperationSerializer
    include FastJsonapi::ObjectSerializer
    attributes :type_operation,
               :hashed_id, :operation, :result, :title,
               :id_url_video_youtube, :help, :point, :show

  end
end
