class Api::UsersController < ApplicationController
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def create_dog
    if current_user
      dog = Dog.new(
        name: params[:name],
        age: params[:age],
        breed: params[:breed],
        user_id: params[:user_id],
      )
      dog.save
      render json: {
        message: dog,
        user: dog.user,
      }
    else
      render json: { message: "you aren't logged in pal" }
    end
  end
end
