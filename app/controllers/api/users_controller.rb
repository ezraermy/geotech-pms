class Api::UsersController < ApplicationController
  def index
    @user = User.find_by(user_name: params[:user_name])
    if user
      render json: user, status: :ok
    else
      render json: { message: 'User not found' }, status: :not_found
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user, status: :ok
    else
      render json: { message: 'User not found' }, status: :not_found
    end
  end

  def user_params
    params.require(:user).permit(:user_name)
  end
end
