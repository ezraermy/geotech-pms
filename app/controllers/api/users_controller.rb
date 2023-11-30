# app/controllers/api/users_controller.rb
module Api
  class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index]

    def create
      user = User.new(user_params)

      if user.save
        render json: { user: user }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def index
      users = User.all
      render json: { users: users }, status: :ok
    end

    private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
  end
end
