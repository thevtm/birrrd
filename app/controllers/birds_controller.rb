class BirdsController < ApplicationController


  def show
    @bird = Bird.find(params[:id])
  end

  def new
    @bird = Bird.new
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

  def search
    @user_search = params[:user_search]
    @results = Bird.search_by_name(@user_search)
  end

  private

  def bird_params
    params.require(:bird).permit(:name, :location, :price)
  end
end
