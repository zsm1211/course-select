require 'test_helper'

class ChooseCourseTest < ActionDispatch::IntegrationTest
  def setup
    @user       = users(:michael)
    @user2      =users(:rongtongjin)
    @teacher    = users(:teacherluo)
    @course1 = courses(:one)
    @course2 = courses(:two)
    @course3 = courses(:three)
  end

  test "test choose course" do
    log_in_as(@user2)
    assert_difference 'Comment.count' do
      get select_course_path(@course2)
      assert_redirected_to courses_path
      assert_not flash.empty?
    end
  end
end
