module Api::V1::Customer
  class CustomerSerializer
    include FastJsonapi::ObjectSerializer
    attributes :first_name, :last_name, :email,
               :hashed_id, :remote_avatar, :status, :full_name,
               :points, :level
    # has_many :comments

    attribute :assignment_achieveds do |object|
      parsed_info = []
      object.assignment_achieveds.each do |r|
        icon = ""
        icon = r.achievement.icon if r.achievement.icon.present?
        parsed_info.push(
          {
            id: r.id,
            hashed_id: r.hashed_id,
            name: r.achievement.name,
            created_at: r.created_at,
            icon: icon
          }
        )
      end
      parsed_info.as_json
    end
  end
end
