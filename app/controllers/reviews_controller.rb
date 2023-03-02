class ReviewsController < ApplicationController
  before_action :set_experience, only: [:new, :create, :edit, :update]

  def new
    @review = Review.new
  end

  def create
    raise
    @review = Review.new(review_params)
    @review.experience = @experience
    @review.user = current_user
    if @review.save
      redirect_to experience_path(@experience)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to experience_path(@review.experience)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to experience_path(@review.experience), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end
end
