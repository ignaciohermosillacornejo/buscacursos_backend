class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy, :like, :unlike]
  before_action :authenticate, only: [:create, :update, :destroy, :like, :unlike]
  before_action :set_course, only: [:create]
  before_action :check_user_review, only: [:update, :destroy]
  # before_action :current_user

  # GET /reviews (.json)
  def index
    render "status/501_not_implemented", status: :not_implemented
  end

  # GET /reviews/1 (.json)
  def show
    render "status/501_not_implemented", status: :not_implemented
  end

  # POST /reviews (.json)
  def create
    # render "status/422_unprocessable_entity", status: :unprocessable_entity unless review_params[:content].present?
    @review = Review.new(course: @course, user: @current_user, published_at: DateTime.now, state: 1, content: review_params[:content])
    
    if @review.save
      render :show, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH(/PUT) /reviews/1 (.json)
  def update
    if review_params[:content].empty?
      render "error/422_unprocessable_entity", status: :unprocessable_entity
    else
      if @review.update(content: review_params[:content])
        render :show, status: :ok, location: @review
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /reviews/1 (.json)
  def destroy
    if @review.destroy
      render "status/200_ok", status: :ok
    else
      render "status/404_not_found", status: :not_found
    end
  end

  # POST /reviews/1/like (.json)
  def like
    @like = Like.find_or_create_by(review: @review, user: @current_user)
    if @like.save
      render "status/200_ok", status: :ok
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end


  # DELETE /reviews/1/like (.json)
  def unlike
    @like = Like.find_by(review: @review, user: @current_user)
    if @like.present? and @like.destroy
      render "status/200_ok", status: :ok
    else
      render "status/404_not_found", status: :not_found
    end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_course
      @course = Course.find_or_create_by(review_params[:course])
    end

    def check_user_review
      render "status/401_unauthorized", status: :unauthorized unless (@current_user.reviews.include? @review or @current_user.admin?)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:id).permit(:content, {:course => [:name, :number]})
    end
end
