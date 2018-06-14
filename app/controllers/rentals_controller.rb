class RentalsController < ApplicationController
  def new
    @bird = Bird.find(params[:bird_id])
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.bird = Bird.find(params[:bird_id])
    if @rental.save!
      redirect_to rental_path(@rental)
    else
      render 'new'
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:user_id, :bird_id, :start_date, :end_date)
  end
end
