require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new

    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new("hiking")

    assert_equal "hiking", activity.name
  end

  def test_has_participants_initialized_empty_hash
    activity = Activity.new("hiking")

    assert_equal ({}), activity.participants
  end

  def test_has_participants_initialized_by_past_argument
    hash = {"Katy" => 30}
    activity = Activity.new("hiking", hash)

    assert_equal hash, activity.participants
  end

  def test_can_add_participants
    hash = {"Katy" => 30, "Timo" => 20, "Luis" => 40}
    activity = Activity.new("hiking", hash)

    assert_equal hash, activity.add_participants
  end

  def test_it_has_total_amount_paid_of_the_activity
    hash = {"Katy" => 30, "Timo" => 20, "Luis" => 40}
    activity = Activity.new("hiking", hash)

    assert_equal 90, activity.total_paid
  end

  def test_activity_has_cost
    hash = {"Katy" => 30, "Timo" => 20, "Luis" => 40}
    activity = Activity.new("hiking", hash, 120)

    assert_equal 120, activity.total_cost
  end

  def test_it_can_determine_amount_owed
    hash = {"Katy" => 30, "Timo" => 20, "Luis" => 40}
    activity = Activity.new("hiking", hash, 120)

    assert_equal 20, activity.amount_owed("Timo")
  end
end
