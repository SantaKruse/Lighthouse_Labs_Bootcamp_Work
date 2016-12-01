post '/signup' do
  @user = User.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    start_date: Date.today,
    photo_url: '/images/default.png',
    time_of_death: Time.now + (14 * 24 * 60 * 60)

  )
  if @user.save
    session[:user_id] = @user.id
    session[:user_name] = @user.first_name
    redirect '/users'
  else
    erb :'index'
  end
end

post '/login' do
  @user = User.find_by(first_name: params[:first_name])
  if @user
    if @user.last_name == params[:last_name]
      session[:user_id] = @user.id
      session[:user_name] = @user.first_name
      redirect '/users'
    else
      redirect '/'
    end
  else
    redirect '/'
  end
end

post '/logout' do
  session.clear
  session[:user_id] = nil
  session[:users_view] = nil
  redirect '/'
end