require 'auth'

class Api::UsersController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
    render json: User.all
  end

  def signup
    user = User.new(user_params)
    
    if user.save
      token = Auth.create_token({name: user.name, id: user.id, email: user.email})
      
      returned_user = Auth.decode_token(token)

      render json: {name: user.name, id: user.id, email: user.email, token: token}, status: 200
    else
      render json: {message: user.errors}, status: 400
    end
  
  end
  
  def show
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end