post '/response/:assignment_id' do
  current_user = get_user(session[:user_id])
  rating = params[:rating].to_i
  binding.pry
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
    redirect '/users'
  else
    @users = User.all
    @assignments = Assignment.all
    erb :'/users/index'
  end
end