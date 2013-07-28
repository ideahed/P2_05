enable :sessions 

helpers do
  def logged_in?
    !session[:id].nil?
  end

  def current_user
    # TODO: return the current user if there is a user signed in.
    # p current_user 
    current_user ||= User.find_by_id(session[:id])
  end

  def start_session(user)
    # TODO: return the current user if there is a user signed in.
    session[:id] = user.id
  end

end
