class StudentsController < ApplicationController
  before_action :logged_in?
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.where(teacher_id: session[:teacher_id])
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(parent_params)
    @student.teacher_id = session[:teacher_id]
      if @student.save
        redirect_to parents_path, notice: 'Student was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    if @student.update(parent_params)
      redirect_to parents_path, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    redirect_to parents_url, notice: 'Student was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:student).permit(:name, :email, :password_digest, :teacher_id)
    end
end
