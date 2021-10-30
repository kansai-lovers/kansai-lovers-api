class HellosController < ApplicationController
  def index
    @hellos = Hello.all
    render json: @hellos[0]
  end

  def show
    p params[:user_name]
    render json: params[:user_name]
  end
end
