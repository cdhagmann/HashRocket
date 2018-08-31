class SessionsController < ApplicationController
  
def create
  user = User.find_by_username(params[:username])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to posts_path
  else
    flash[:error_message] = "Something went wrong!!!!. Please try again!"
    render 'new'
   
  end
end

def destroy
  session[:user_id] = nil
  flash[:notice] = "You've been logged out"
  redirect_to root_path
end

end