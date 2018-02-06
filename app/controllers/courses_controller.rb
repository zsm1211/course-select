class CoursesController < ApplicationController
  include CoursesHelper
  before_action :student_logged_in, only: [:select, :quit, :list, :show, :show_more_4,:apply,:advise, :timetable, :is_open]
  before_action :teacher_logged_in, only: [:new, :create, :edit, :destroy, :update,:chart,:selected,:semester]
  before_action :logged_in, only: :index

  #-------------------------for teachers----------------------

  def new
    @course=Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.course_score="暂无评分"
    #@course.update_attributes(:course_score=>"暂无评分")
    @semester=Semester.where(:is_open=>true)
    if @semester==nil||@semester.count>1
      redirect_to courses_path, flash: {success: "暂时不能创建课程课"}
    else
      @course.semester_id=@semester.first.id
    end
    if @course.save
      current_user.teaching_courses<<@course
      redirect_to courses_path, flash: {success: "新课程申请成功"}
    else
      flash[:warning] = "信息填写有误,请重试"
      render 'new'
    end
  end

  def edit
    @course=Course.find_by_id(params[:id])
  end



  def update
    @course = Course.find_by_id(params[:id])
    if @course.update_attributes(course_params)
      flash={:info => "更新成功"}
    else
      flash={:warning => "更新失败"}
    end
    redirect_to courses_path, flash: flash
  end

  def destroy
    @course=Course.find_by_id(params[:id])
    current_user.teaching_courses.delete(@course)
    @course.destroy
    flash={:success => "成功删除课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def open
    @course = Course.find_by_id(params[:id])
    if @course.update_attributes(:open=>true)
      flash={:info => "开通成功"}
    else
      flash={:warning => "开通失败"}
    end
    redirect_to courses_path, flash: {success: "已经成功开通该课程:#{ @course.name}"}
  end

  def close
    @course = Course.find_by_id(params[:id])
    if @course.update_attributes(:open=>false)
      flash={:info => "关闭成功"}
    else
      flash={:warning => "关闭失败"}
    end
    redirect_to courses_path, flash: {success: "已经成功关闭该课程:#{ @course.name}"}
  end
  def selected
    @course = Course.find_by_id(params[:id])
    @grades=@course.grades.where(:open=>false)
    student = []
    @grades.each do |grade|
      if grade.open = true
        student<<User.find_by_id(grade.user_id)
      end
    end
    @student=student
  end

  def chart
    @course = Course.find_by_id(params[:id])
    @grades=@course.grades.where(:open=>false)
    student = []
    @grades.each do |grade|
      if grade.open = true
        student<<User.find_by_id(grade.user_id)
      end
    end
    @student_department = {}
    student.each do |stu|
      if !@student_department.has_key?(stu.department)
        @student_department[stu.department] =0
      end
      @student_department[stu.department] += 1
    end
  end

  def semester
    @course = current_user.teaching_courses.where(semester: params[:id])
  end
  #-------------------------for students----------------------
  def list
    @course=Course.all
    @q = Course.ransack(params[:q])
    @course = @q.result.includes(:teacher)
    @course = @q.result(distinct: true)
    @course=@course.where(:open=>true)
    @course=@course-current_user.courses
    @current_user_course=current_user.courses
    @course_time_table = get_current_curriculum_table(@current_user_course, current_user)
    @course_time = get_course_info(@course, 'course_time')
    @course_exam_type = get_course_info(@course, 'exam_type')
    @course_credit = get_course_info(@course, 'credit')
    @course_type = get_course_info(@course, 'course_type')
    @teaching_type = get_course_info(@course, 'teaching_type')
    if request.post?
      res = []
      @course.each do |course|
        if check_course_condition(course, 'course_time', params['course_time']) and
            check_course_condition(course, 'exam_type', params['exam_type']) and
            check_course_condition(course, 'course_type', params['course_type']) and
            check_course_condition(course, 'credit', params['course_credit']) and
            check_course_condition(course, 'teaching_type', params['teaching_type']) and
          res << course
        end
        @course=res
      end
    end
  end

  def select
    @course=Course.find_by_id(params[:id])
    current_user.courses<<@course
    Grade.create(:user_id => current_user.id, :course_id => @course.id)
    flash={:success => "成功选择课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  def open_visit
    @course=Course.find_by_id(params[:id])
    current_user.courses<<@course
    Grade.create(:user_id => current_user.id, :course_id => @course.id,:open => true)
    flash={:success => "成功旁听课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end

  #------显示课表--把已选的课程传给课表
  def timetable
    @course=current_user.courses
    @course_credit = get_course_info(@course, 'credit')
    @current_user_course=current_user.courses
    @user=current_user
    @course_time_table = get_current_curriculum_table(@course,@user)#当前课表
  end

  def swap
    @course=Course.find_by_id(params[:id])
    @current_user_course=current_user.courses
      @current_user_course.each do |current_user_course|
        if  current_user_course.course_time == @course.course_time
          @info = current_user_course.name
          current_user.courses.delete(current_user_course)
          Grade.where(:user_id => current_user.id, :course_id => current_user_course.id).take.destroy()
          break
    end
      end
    @course=Course.find_by_id(params[:id])
    current_user.courses<<@course
    Grade.create(:user_id => current_user.id, :course_id => @course.id)
    flash={:success => "成功选择课程: #{@course.name} 成功退选课程: #{@info}"}
    redirect_to courses_path, flash: flash
  end

  def quit
    @course=Course.find_by_id(params[:id])
    Grade.where(:user_id => current_user.id, :course_id => @course.id).take.destroy()
    current_user.courses.delete(@course)
    flash={:success => "成功退选课程: #{@course.name}"}
    redirect_to courses_path, flash: flash
  end
  def show
    @course=Course.find_by_id(params[:id])
  end
  def show_more_1
    @course=Course.find_by_id(params[:id])
  end
  def show_more_2
    @course=Course.find_by_id(params[:id])
  end
  def show_more_3
    @course=Course.find_by_id(params[:id])
  end
  def show_more_4
    @course=Course.find_by_id(params[:id])
  end

  def apply
    @course=Course.find_by_id(params[:id])
    @current_user = current_user
  end

  def advise
    @course=Course.find_by_id(params[:id])
    @current_user = current_user
  end

  #-------------------------for both teachers and students----------------------

  def index
    @course=current_user.teaching_courses if teacher_logged_in?
    if student_logged_in?
      @course=current_user.courses
      #@course.each do |course|
         # @is_open_course = is_open_course(course, current_user)
      #end
    end
  end

  private

  # Confirms a student logged-in user.
  def student_logged_in
    unless student_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a teacher logged-in user.
  def teacher_logged_in
    unless teacher_logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  # Confirms a  logged-in user.
  def logged_in
    unless logged_in?
      redirect_to root_url, flash: {danger: '请登陆'}
    end
  end

  def course_params
    params.require(:course).permit(:course_code, :name, :course_type, :teaching_type, :exam_type,
                                   :credit, :limit_num, :class_room, :course_time, :course_week, :course_difficulty, :course_suit, :course_score, :course_outline, :course_exam_details, :course_chapter, :course_live, :course_homework, :course_teamwork, :semester_id)
  end


end
