class StudentsController < ApplicationController
  before_action :logged_in?
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
  end

  def index
    @student = Student.find_by_id(session[:student_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(session[:student_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:student).permit(:name, :email, :password_digest, :teacher_id, :password_confirmation)
    end

    def logged_in?
      if session[:user_type] == "parent" || session[:user_type] == "teacher"
        redirect_to login_path, notice: "You can't view that page"
      else
        true
      end
    end
end
