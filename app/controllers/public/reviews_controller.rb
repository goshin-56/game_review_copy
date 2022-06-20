class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
    @game = Game.find(params[:game_id])
  end

  def create
    @game = Game.find(params[:game_id])
    @review = current_customer.reviews.new(review_params)
    @review.game_id = params[:game_id]
    @review.save
    redirect_to public_game_path(@game)
  end

  def show
    @game = Game.find(params[:game_id])
    @review = Review.find(params[:id])
    @comments = @review.comments
    @comment = current_customer.comments.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to public_review_path(@review.id)
    else
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
      redirect_to public_reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :game_id)
  end
end
