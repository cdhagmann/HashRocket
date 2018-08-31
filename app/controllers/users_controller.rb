class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to sessions_url, notice:  "You've created a new account!! Please log in."
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :password,
                                   :password_confirmation)
    end
end


