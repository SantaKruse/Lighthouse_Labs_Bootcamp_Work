require_relative 'controllers/helpers'
require_relative 'controllers/auth'
require_relative 'controllers/assignments'
require_relative 'controllers/users'

get '/' do # Homepage (Root path)
  @user = User.new
  erb :index
end

get '/stats' do # /users/stats
  colors = ['color: #2374AA', 'color: #C24545', 'color: #8EBA56','color: #7A5A91','color: #179AB1','color: #EBA271','color: #8CAAD1']
  @ruby_points = User.select("users.id, users.last_name, users.first_name, ROUND(CASE WHEN SUM(assignments.ruby_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) IS NULL THEN 0 ELSE SUM(assignments.ruby_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) END, 0) as all_points")
  .joins("LEFT OUTER JOIN responses ON users.id = responses.user_id LEFT OUTER JOIN assignments ON responses.assignment_id = assignments.id")
  .group("users.id, users.last_name, users.first_name")
  @ruby_arr_of_arr = []
  color_counter = 0
  @ruby_points.each do |user|
      @ruby_arr_of_arr << ["#{user.first_name} #{user.last_name}", user.all_points, colors[color_counter]]
      if color_counter == 4
        color_counter = 0
      else
        color_counter += 1
      end
  end

  @html_points = User.select("users.id, users.last_name, users.first_name, ROUND(CASE WHEN SUM(assignments.html_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) IS NULL THEN 0 ELSE SUM(assignments.html_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) END, 0) as all_points")
  .joins("LEFT OUTER JOIN responses ON users.id = responses.user_id LEFT OUTER JOIN assignments ON responses.assignment_id = assignments.id")
  .group("users.id")
  @html_arr_of_arr = []
  @html_points.each do |user|
      @html_arr_of_arr << ["#{user.first_name} #{user.last_name}", user.all_points, colors[color_counter]]
      if color_counter == 4
        color_counter = 0
      else
        color_counter += 1
      end
  end

  @database_points = User.select("users.id, users.last_name, users.first_name, ROUND(CASE WHEN SUM(assignments.database_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) IS NULL THEN 0 ELSE SUM(assignments.database_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) END, 0) as all_points")
  .joins("LEFT OUTER JOIN  responses ON users.id = responses.user_id LEFT OUTER JOIN assignments ON responses.assignment_id = assignments.id")
  .group("users.id")
  @database_arr_of_arr = []
  @database_points.each do |user|
      @database_arr_of_arr << ["#{user.first_name} #{user.last_name}", user.all_points, colors[color_counter]]
      if color_counter == 4
        color_counter = 0
      else
        color_counter += 1
      end
  end

  @time_left = User.select("users.id, users.last_name, users.first_name, (strftime('%s', users.time_of_death) - strftime('%s','now'))/(60 * 60) as time_left")
  .where("time_left >= 0")
  @time_left_arr_of_arr = []
  @time_left.each do |user|
      @time_left_arr_of_arr << ["#{user.first_name} #{user.last_name}", user.time_left, colors[color_counter]]
      if color_counter == 4
        color_counter = 0
      else
        color_counter += 1
      end
  end

  erb :'stats/index'
end

