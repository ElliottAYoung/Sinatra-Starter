#Initial form for logging in
get '/login' do
  erb :"auth/login"
end

#validate the login
post '/login' do
  user = User.find_by(user_name: params[:user_name])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    p session[:user_id]
    redirect "/users/#{user.id}"
  else
    redirect "/"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect "/"
end








