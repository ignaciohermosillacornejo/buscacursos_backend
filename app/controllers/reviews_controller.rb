class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :set_course, only: [:create, :update]
  before_action :check_user_review, only: [:update, :destroy]
  # before_action :current_user

  # GET /reviews
  # GET /reviews.json
  def index
    render "error/501_not_implemented", status: :not_implemented
    #@reviews = Review.all
    #render :index, status: :ok
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    render "error/501_not_implemented", status: :not_implemented
  end

  # POST /reviews
  # POST /reviews.json
  def create
    if review_params[:content].empty?
      render "error/422_unprocessable_entity", status: :unprocessable_entity
    else
      @review = Review.new(course: @course, user: @current_user, published_at: DateTime.now, state: 1, content: review_params[:content])

      if @review.save
        render :show, status: :created, location: @review
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
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

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    render "error/200_ok", status: :ok
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
      render "error/401_unauthorized", status: :unauthorized unless (@current_user.reviews.include? @review or @current_user.admin?)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:content, {:course => [:name, :number]})
    end
end
