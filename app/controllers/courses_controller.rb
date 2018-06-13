class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]
  before_action :optional_authentication, only: [:show]
  before_action :authenticate, only: [:create]

  # GET /courses (.json)
  def index
    render "status/501_not_implemented", status: :not_implemented
    #@courses = Course.all
  end

  # GET /courses/IIC2133 (.json)
  def show
    #render "status/501_not_implemented", status: :not_implemented
    @reviews = @course.reviews.sort_by {|obj| obj.likes.length}.reverse
  end

  # POST /courses
  # POST /courses.json
  def create
    render "status/501_not_implemented", status: :not_implemented
    #@course = Course.new(course_params)
    #
    #if @course.save
    #  render :show, status: :created, location: @course
    #else
    #  render json: @course.errors, status: :unprocessable_entity
    #end
  end

  # PATCH/PUT /courses/1 (.json)
  def update
    render "status/501_not_implemented", status: :not_implemented
    #if @course.update(course_params)
    #  render :show, status: :ok, location: @course
    #else
    #  render json: @course.errors, status: :unprocessable_entity
    #end
  end

  # DELETE /courses/1 (.json)
  def destroy
    render "status/501_not_implemented", status: :not_implemented
    #@course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.where(number: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :number)
    end
end
