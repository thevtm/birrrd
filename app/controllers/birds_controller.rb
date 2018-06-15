class BirdsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @birds = Bird.where.not(latitude: nil, longitude: nil)

    @markers = @birds.map do |bird|
      {
        lat: bird.latitude,
        lng: bird.longitude#,
        # infoWindow: { content: render_to_string(partial: "/birds/map_box", locals: { bird: bird }) }
      }
    end
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

  def destroy
    @bird = Bird.find(params[:id])
    @bird.destroy
    redirect_to birds_path(@birds)
    # ideally this would first take you to a form that says "sure you wanna delete the bird?" and after deleting, lead to your dashbord.
  end

  def search
    @user_search = params[:user_search]
    @results = Bird.search_by_name(@user_search)
  end

  private

  def bird_params
    params.require(:bird).permit(:name, :location, :price, :description, :photo)
  end

end
