class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = <<~SQL
        experiences.title @@ :query
        OR experiences.description @@ :query
        OR experiences.category @@ :query
        OR experiences.location @@ :query
        OR users.first_name @@ :query
        OR users.last_name @@ :query
      SQL
      @experiences = Experience.joins(:user).where(sql_query, query: "%#{params[:query]}%")
      if @experiences.empty?
        flash[:notice] = "No results found for '#{params[:query]}'. Please try again."
        redirect_back(fallback_location: experiences_path)
      end
    else
      @experiences = Experience.all
    end
  end


  def show
    @experience = Experience.find(params[:id])
    # fetch the reviews of the experience and set them in a global variable to gain access to them in the show html
    @reviews = @experience.reviews
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
    params.require(:experience).permit(:title, :category, :location, :description, photos: [])
  end
end
