class TeachersController < ApplicationController
  before_action :logged_in?
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def edit
    @teacher = Teacher.find_by_id(session[:teacher_id])
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to parents_path, notice: 'Teacher was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_teacher
      @teacher = Teacher.find(session[:teacher_id])
    end

    def teacher_params
      params.require(:teacher).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in?
      if Teacher.find_by_id(session[:teacher_id])
        return true
      else
        redirect_to sessions_login_path, notice: "User not logged in!"
      end
    end
end
