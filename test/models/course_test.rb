require 'test_helper'


class CourseTest < ActiveSupport::TestCase
  def setup
    @course = couse(:valid)
  end

  test 'valid course' do
    course = Course.new()
    assert course.valid?
  end

  test 'many reviews' do
    #course = Course.new()
    assert_equal 2, @course.reviews.size
    assert true
  end
end
