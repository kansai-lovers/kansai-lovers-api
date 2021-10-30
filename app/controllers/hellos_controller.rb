class HellosController < ApplicationController
  def index
    @hellos = Hello.all
    render json: @hellos[0]
  end

  def show
    response = {value: params[:user_name], test: "test"}
    render json: response
  end
end
