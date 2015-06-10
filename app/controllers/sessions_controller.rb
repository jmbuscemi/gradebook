class SessionsController < ApplicationController
  def login
    if request.post?
      teacher = Teacher.find_by_email(params[:email])
      student = Student.find_by_email(params[:email])
      parent = Parent.find_by_email(params[:email])
      if teacher != nil && teacher.authenticate(params[:password])
        session[:teacher_id] = teacher.id
        session[:user_type] = "teacher"
        redirect_to teachers_path, notice: "Login Successul!"
      elsif student != nil && student.authenticate(params[:password])
        session[:student_id] = student.id
        session[:user_type] = "student"
        redirect_to students_path, notice: "Login Successul!"
      elsif parent != nil && parent.authenticate(params[:password])
        session[:parent_id] = parent.id
        session[:user_type] = "parent"
        redirect_to parents_path, notice: "Login Successul!"
      else
        flash.now[:notice] = "Invalid username/password"
      end
    end
  end

  def logout
    session[:teacher_id] = nil
    session[:student_id] = nil
    session[:parent_id] = nil
    session[:user_type] = nil
    redirect_to login_path, notice: "Logout Successful!"
  end
end
