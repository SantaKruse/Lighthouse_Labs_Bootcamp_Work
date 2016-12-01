get '/generate_question' do
  assignmentID = params[:assignment_id]
  difficulty = params[:difficulty]
  # given this assignment id then grab the question info needed from server db
  # pass instance of Question through json to jQuery to change html
  question = Question.where(assignment_id: assignmentID,difficulty: difficulty).first
  json question
end


post '/response/:assignment_id' do
  current_user = get_user(session[:user_id])
  current_assignment = get_assignment(params[:assignment_id])

  rating = params[:rating].to_i
  a_id = params[:assignment_id].to_i
  user_answer = params[:answer]
  question = Question.where(assignment_id: a_id, difficulty: rating).first

  if to_boolean(user_answer) != question.answer 
    rating = 3 # if user got the answer wrong then give lowest points
  end

  # note that for some reason you can't call the instance variable @response
  @answer = Response.new(
    user_id: current_user.id, 
    assignment_id: a_id, 
    rating: rating
  )

  if @answer.save
    # assignments  in hours add to current user time of death

    current_user.time_of_death += (current_assignment.die_hours * 60 * 60)
    current_user.save

    redirect "/users/#{current_user.id}"
  else
    @users = User.all
    @assignments = Assignment.all
    erb :"/users/#{current_user.id}"
  end
end