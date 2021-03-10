class Api::DogsController < ApplicationController
  def create
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
