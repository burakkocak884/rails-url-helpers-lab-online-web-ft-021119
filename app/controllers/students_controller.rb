
class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    set_student

  end

  def activate
    @student = Student.find_by(params[:id])
   
    if @student.active == false
      @student.update(active: true)
    else
      @student.update(active: false)
    end
    @student.save
    redirect_to student_path
  end


  private

    def set_student
      @student = Student.find(params[:id])

    end






end