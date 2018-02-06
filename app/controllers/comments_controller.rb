class CommentsController < ApplicationController

  def semester
    @course = current_user.teaching_courses.where(semester: params[:id])
  end

  def edit
    @comment=Comment.find_by_id(params[:id])
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    if @comment.update_attributes(comment_params)
      @comment.commented = true
      if @comment.save
        flash={:success => "#{@comment.course.name}已评估"}
        redirect_to comments_path, flash: flash
      else
        flash={:info => "评估失败"}
        redirect_to edit_comment_path, flash: flash
      end
    else
      flash={:warning => "评估失败"}
      redirect_to edit_comment_path, flash: flash
    end
  end

  def list
    @course=Course.find_by_id(params[:course_id])
    @comments=@course.comments
    @comments_score = Array[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @comments_count = Array[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    @comments.each do |comment|
      if !(comment.item_one.nil?) then
        @comments_count[0]+=1
        @comments_score[0] += comment.item_one
      end
      if !(comment.item_two.nil?) then
        @comments_count[1]+=1
        @comments_score[1] += comment.item_two
      end
      if !(comment.item_three.nil?) then
        @comments_count[2]+=1
        @comments_score[2] += comment.item_three
      end
      if !(comment.item_four.nil?) then
        @comments_count[3]+=1
        @comments_score[3] += comment.item_four
      end
      if !(comment.item_five.nil?) then
        @comments_count[4]+=1
        @comments_score[4] += comment.item_five
      end
      if !(comment.item_six.nil?) then
        @comments_count[5]+=1
        @comments_score[5] += comment.item_six
      end
      if !(comment.item_seven.nil?) then
        @comments_count[6]+=1
        @comments_score[6] += comment.item_seven
      end
      if !(comment.item_eight.nil?) then
        @comments_count[7]+=1
        @comments_score[7] += comment.item_eight
      end
      if !(comment.item_nine.nil?) then
        @comments_count[8]+=1
        @comments_score[8] += comment.item_nine
      end
      if !(comment.item_ten.nil?) then
        @comments_count[9]+=1
        @comments_score[9] += comment.item_ten
      end
      if !(comment.item_eleven.nil?) then
        @comments_count[10]+=1
        @comments_score[10] += comment.item_eleven
      end
      if !(comment.item_twelve.nil?) then
        @comments_count[11]+=1
        @comments_score[11] += comment.item_twelve
      end
      if !(comment.item_thirteen.nil?) then
        @comments_count[12]+=1
        @comments_score[12] += comment.item_thirteen
      end
      if !(comment.item_fourteen.nil?) then
        @comments_count[13]+=1
        @comments_score[13] += comment.item_fourteen
      end
      if !(comment.item_fifteen.nil?) then
        @comments_count[14]+=1
        @comments_score[14] += comment.item_fifteen
      end
      if !(comment.item_sixteen.nil?) then
        @comments_count[15]+=1
        @comments_score[15] += comment.item_sixteen
      end
      if !(comment.item_seventeen.nil?) then
        @comments_count[16]+=1
        @comments_score[16] += comment.item_seventeen
      end
    end
      @i = 0
      @i_count = 0
      @comments_score_sum = 0
      while @i < 17 do
        if  @comments_count[@i] > 0then
          @i_count+=1
        @comments_score[@i] /=  @comments_count[@i]
        @comments_score_sum += @comments_score[@i]
        end
        @i+=1
      end
    if @i_count > 0
     @comments_score_sum /= @i_count
     @course.update_attributes(:course_score=>@comments_score_sum)
      end
  end

  def index
    @courses=current_user.courses if student_logged_in?
    @comments=current_user.comments if student_logged_in?
    @course=current_user.teaching_courses if teacher_logged_in?
    @comments=@course.comments if teacher_logged_in?
  end

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
                                   :credit, :limit_num, :class_room, :course_time, :course_week)
  end
  def comment_params
    params.require(:comment).permit(:item_one, :item_two, :item_three, :item_four, :item_five,:item_six,
                                    :item_seven, :item_eight, :item_nine, :item_ten, :item_eleven,:item_twelve,
                                    :item_thirteen,:item_fourteen,:item_fifteen,:item_sixteen,:item_seventeen,
                                    :comment_advantage,:comment_disadvantage)
  end
end