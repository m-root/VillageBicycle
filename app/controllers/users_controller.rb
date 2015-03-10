class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    render :new unless confirmed_password?

    @user = User.new(user_params)

    if @user.save
      log_in(@user)

      redirect_to user_url(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_url(current_user.id)
    else
      render :edit
    end
  end

  private

      def user_params
        params.require(:user).permit(:email, :password, :fname, :lname, :bio,
                                     :street_number, :street)
      end

      def confirmed_password?
        params[:user][:password] == params[:user][:confirm_password]
      end
end