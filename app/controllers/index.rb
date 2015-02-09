enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/signup' do
  User.create(username: params[:username],password: params[:password])
  redirect to '/'
end

post '/login' do
  user = User.where(username: params[:username], password: params[:password]).first
  if user != nil
    session[:u_id] = user.id
    redirect to "/user/#{user.id}"
  else
    redirect to '/'
  end
end

get '/user/:u_id' do
  @user = User.find params[:u_id]
  erb :main
end

post '/logout' do
  session.clear

  redirect to '/'
end