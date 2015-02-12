#Initial form for logging in
get '/login' do
  erb :"auth/login"
end

#validate the login
post '/login' do
  user = User.find_by(user_name: params[:user][:user_name])
  
  if (user && user.authenticated?(params[:user][:password])).tap{|x| p x }
    session[:user_id] = user.id
    puts "Session id"
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








