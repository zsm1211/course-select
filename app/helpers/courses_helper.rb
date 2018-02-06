require 'set'

module CoursesHelper
  def week_data_to_num(week_data)
    param = {
        '周一' => 0,
        '周二' => 1,
        '周三' => 2,
        '周四' => 3,
        '周五' => 4,
        '周六' => 5,
        '周天' => 6,
    }
    param[week_data] + 1
  end
  #生成11行7列的数据
  def get_current_curriculum_table(courses,user)
    # course_time = Array.new(11) { Array.new(7, '') }
    course_time = Array.new(11) {Array.new(7) {Array.new(3, '')}}
    courses.each do |cur|
      real_course_name = cur.name
      @grades = cur.grades
      # check whether the course is open.
      @grades.each do |grade|
        if grade.user.name == user.name
          if grade.open==true
            # if it is open, append "_open" to the course name.
           real_course_name = real_course_name.concat("_open")
          end
        end
      end
      cur_time = String(cur.course_time)
      cur_id = cur.course_time
      end_j = cur_time.index('(')#index第一次出现的字节位置 end_j=2
      j = week_data_to_num(cur_time[0...end_j])
      t = cur_time[end_j + 1...cur_time.index(')')].split("-")
      for i in (t[0].to_i..t[1].to_i).each
        course_time[(i-1)*7/7][j-1][0] = real_course_name
        course_time[(i-1)*7/7][j-1][1] = cur.course_week
        course_time[(i-1)*7/7][j-1][2] = cur.class_room
      end
    end
    course_time
  end

  def is_open_course(course, user)
    @grades=course.grades
    @is_open = false
    @grades.each do |grade|
      if grade.user.name == user.name
         if grade.open == true
          @is_open = true
         end
      end
    end
    return @is_open
  end

  def get_course_info(courses, type)
    res = Set.new
    courses.each do |course|
      res.add(course[type])
    end
    res.to_a.sort
  end

  def check_course_condition(course, key, value)
    if value == '' or course[key] == value
      return true
    end
    false
  end

end