class TeachersController < ApplicationController
  before_action :logged_in?
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.find_by_id(session[:teacher_id])
    @students = Student.where(teacher_id: session[:teacher_id])
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
    @teacher = Teacher.find_by_id(session[:teacher_id])
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher, notice: 'Teacher was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    if @teacher.update(teacher_params)
      redirect_to teachers_path, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(session[:teacher_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:name, :email, :password_digest, :teacher_id, :password_confirmation)
    end

    def logged_in?
      if session[:user_type] == "parent" || session[:user_type] == "student"
        redirect_to login_path, notice: "You can't view that page"
      else
        true
      end
    end
end
