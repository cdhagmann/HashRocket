class SessionsController < ApplicationController
  
def create
  user = User.find_by_email(params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    #redirect_to root_path
    redirect_to books_path
  else
    flash[:error_message] = "Something went wrong!!!!. Please try again!"
    redirect_to new_session_path
  end
end

def destroy
  session[:user_id] = nil
  flash[:notice] = "You've been logged out"
  # ---- new session
  redirect_to root_path
end

end