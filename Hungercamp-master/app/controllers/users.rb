get '/users' do # main users page 
  # with all users showing who is dead
  # then show assignment feedback for that user
  @users = User.all
  @assignments = Assignment.all
  @dead = []
  # instance variable for all users to be created
  erb :'users/index'
end


# need route for posting assignment responses to database 


get '/users/:id' do |id|  # /users/show AKA /users/:id
  @user = User.find(id)
  @arr_of_arr = []
  @ruby_points = User.select("users.id, users.last_name, users.first_name, ROUND(CASE WHEN SUM(assignments.ruby_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) IS NULL THEN 0 ELSE SUM(assignments.ruby_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) END, 0) as all_points")
  .joins("LEFT OUTER JOIN responses ON users.id = responses.user_id LEFT OUTER JOIN assignments ON responses.assignment_id = assignments.id")
  .where("users.id = #{@user.id}")
  .group("users.id, users.last_name, users.first_name")
  @max_poss_ruby = Assignment.select("case when sum(ruby_points)is null then 0 else sum(ruby_points) end as max_points")
  .where("date(date('#{@user.start_date}'),'+'||assignments.due_date||' days') <= date('now')")
  @arr_of_arr << ["Ruby Points", @ruby_points.first.all_points, 'color: #2374AA', @max_poss_ruby.first.max_points - @ruby_points.first.all_points]

  @html_points = User.select("users.id, users.last_name, users.first_name, ROUND(CASE WHEN SUM(assignments.html_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) IS NULL THEN 0 ELSE SUM(assignments.html_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) END, 0) as all_points")
  .joins("LEFT OUTER JOIN responses ON users.id = responses.user_id LEFT OUTER JOIN assignments ON responses.assignment_id = assignments.id")
  .where("users.id = #{@user.id}")
  .group("users.id, users.last_name, users.first_name")
  @max_poss_html = Assignment.select("case when sum(html_points)is null then 0 else sum(html_points) end as max_points")
  .where("date(date('#{@user.start_date}'),'+'||assignments.due_date||' days') <= date('now')")
  @arr_of_arr << ["Html Points", @html_points.first.all_points,'color: #C24545', @max_poss_html.first.max_points - @html_points.first.all_points]

  @database_points = User.select("users.id, users.last_name, users.first_name, ROUND(CASE WHEN SUM(assignments.database_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) IS NULL THEN 0 ELSE SUM(assignments.database_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) END, 0) as all_points")
  .joins("LEFT OUTER JOIN responses ON users.id = responses.user_id LEFT OUTER JOIN assignments ON responses.assignment_id = assignments.id")
  .where("users.id = #{@user.id}")
  .group("users.id, users.last_name, users.first_name")
  @max_poss_database = Assignment.select("case when sum(database_points)is null then 0 else sum(database_points) end as max_points")
  .where("date(date('#{@user.start_date}'),'+'||assignments.due_date||' days') <= date('now')")
  @arr_of_arr << ["Database Points", @database_points.first.all_points, 'color: #8EBA56', @max_poss_database.first.max_points - @database_points.first.all_points]

  erb :'users/show'
end