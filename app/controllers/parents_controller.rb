class ParentsController < ApplicationController
  before_action :logged_in?, except: [:new, :create]
  before_action :set_parent, only: [:show, :edit, :update, :destroy]

  def new
    if session[:teacher_id]
      @parent = Parent.new
    else
      flash.now[:alert] = "You can't access this page"
    end
  end

  def create
    @parent = Parent.new(parent_params)
    @parent.teacher_id = session[:teacher_id]
    if @parent.save
      redirect_to teachers_path, notice: 'Parent was successfully created.'
    else
      render :new
    end
  end

  def index
    @parent = Parent.find_by_id(session[:parent_id])
    @kid = @parent.student 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(session[:parent_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:name, :email, :password, :teacher_id, :password_confirmation)
    end

    def logged_in?
      if session[:user_type] == "student" || session[:user_type] == "teacher"
        redirect_to login_path, notice: "You can't view that page"
      else
        true
      end
    end
end
