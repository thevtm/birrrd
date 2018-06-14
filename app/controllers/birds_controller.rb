class BirdsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @birds = Bird.all
  end

  def show
    @bird = Bird.find(params[:id])
  end

  def new
    @bird = Bird.new
  end

  def edit
    @user = current_user
    @bird = Bird.find(params[:id])
    if @user != @bird.user
      redirect_to bird_path(@bird)
    end
  end

  def update
    @bird = Bird.find(params[:id])
      @bird.update(bird_params)
      redirect_to bird_path(@bird)
  end

  def create
    @bird = Bird.new(bird_params)
    @bird.user = current_user
    if @bird.save!
      redirect_to bird_path(@bird)
    else
      render 'new'
    end
  end


  private

  def bird_params
    params.require(:bird).permit(:name, :location, :price, :photo)
  end

end
