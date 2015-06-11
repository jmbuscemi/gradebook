class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  def index
    @grades = Grade.all
  end

  def show
  end

  def new
    @grade = Grade.new
  end

  def edit
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to @grade, notice: 'Grade was successfully created.'
    else
      render :new
    end
  end

  def update
    if @grade.update(grade_params)
      redirect_to teachers_path, notice: 'Grade was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @grade.destroy
      redirect_to grades_url, notice: 'Grade was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:grade, :assignment_name, :student_id)
    end
end
