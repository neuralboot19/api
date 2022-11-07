module Api::V1::Customers
  class CustomersController < ApiCustomersController

    def close
      return set_response(200,
                          'Su cuenta ha sido cerrada') if @user.close
    end

    def point
      @user.points = @user.points + params["points"]
      search_level_whe_points = Level.find_by_points(@user.points)
      @user.level = search_level_whe_points.name if search_level_whe_points.present?
      search_achievement = Achievement.find_by_points(@user.points)
      AssignmentAchieved.create!(user: @user, achievement: search_achievement) if search_achievement.present?
      return set_response(200, 'Success POINTS', serialize_customer(@user)) if @user.save
    end

  end
end
