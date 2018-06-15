class ReviewsController < ApplicationController
  def new
    @bird = Bird.find(params[:bird_id])
    @review = Review.new
  end

  def create
    @bird = Bird.find(params[:bird_id])
    @user = current_user

    @review = Review.new(review_params)
    @review.user = @user
    @review.bird = @bird

    if @review.save
      redirect_to @bird
    else
      render 'new'
    end
  end

  def delete
    @bird = Bird.find(params[:bird_id])
    @review = Review.find(params[:id])

    @bird.delete if @bird.user == current_user

    redirect_to @bird
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :bird_id, :title, :content)
  end
end
