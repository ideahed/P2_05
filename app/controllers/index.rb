get '/' do

 # render home page
 #TODO: Show all users if user is signed in
 @users = User.all
 erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  p params
  user = User.find_by_email(params[:user])
  start_session(user)
  redirect '/'
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  session.clear
end

#----------- USERS -----------

get '/users/new' do
  p 'users/new' * 40
  # render sign-up page
  erb :sign_up
end

post '/users' do
p params 
  # sign-up a new user  
# session[:id] = User.create(name: params[:name], email: params[:email], password: params[:password])
user = User.create(params[:user])
start_session(user) 
redirect '/'
end
