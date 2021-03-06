class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  def update
    user = User.find(params[:id])
    if user
      user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors.full_messages
    end

  end

  def destroy
      user = User.find(params[:id])

      if user
        user.destroy
        render json: user
      else
        render json:  user.errors.full_messages
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
