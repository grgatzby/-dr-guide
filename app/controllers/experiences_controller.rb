class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experiences_params)
    @experience.user = current_user
    if @experience.save
      redirect_to experiences_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.update(experiences_params)
    redirect_to experiences_path
  end


  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to experiences_path, status: :see_other
  end

  private

  def experiences_params
    # Guillaume added :photo
    params.require(:experience).permit(:title, :category, :location, :photo)
  end
end
