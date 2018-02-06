require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @semester=semesters(:Autumn2016)
    @course=Course.new(name:"Example Course",
                       course_code: "091M4002H",
                        course_type: "专业核心课",
                        credit: "60/3.0",
                        limit_num: "",
                        course_week: "第2-20周",
                        course_time: "周五(2-4)",
                        semester: @semester,
                        class_room: "教1-107",
                        teaching_type: "课堂讲授为主",
                        exam_type: "闭卷笔试")
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "name should be valid" do
    @course.name="     "
    assert_not @course.valid?
  end

  test "course_type should be valid" do
    @course.course_type="     "
    assert_not @course.valid?
  end

  test "course_time should be valid" do
    @course.course_time="     "
    assert_not @course.valid?
  end

  test "course_week should be valid" do
    @course.course_week="     "
    assert_not @course.valid?
  end

  test "class_room should be valid" do
    @course.class_room="     "
    assert_not @course.valid?
  end

  test "credit should be valid" do
    @course.credit="     "
    assert_not @course.valid?
  end

  test "teaching type should be valid" do
    @course.teaching_type="     "
    assert_not @course.valid?
  end

  test "exam_type should be valid" do
    @course.exam_type="     "
    assert_not @course.valid?
  end

end
