require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def test_it_exists
    union = Reunion.new

    assert_instance_of Reunion, union
  end

  def test_it_has_a_location
    union = Reunion.new("Aspen")

    assert_equal "Aspen", union.location
  end

  def test_can_be_initialized_with_activity_of_empty_array
    union = Reunion.new("Aspen")

    assert_equal [], union.activities
  end

  def test_can_be_initialized_by_past_arguments
    union = Reunion.new("Aspen")
    union.add_activity(Activity.new("Skiing", 20))

    assert_equal 1, union.activities.length
    assert_instance_of Activity, union.activities[0]
  end

  def test_it_determines_total_cost_of_the_reunion
    union = Reunion.new("Aspen")
    union.add_activity(Activity.new("Skiing", 20))
    union.add_activity(Activity.new("Snow boarding", 40))

    assert_equal 240, union.total_cost
  end
end
