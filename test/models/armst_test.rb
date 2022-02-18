require_relative  '../test_helper'

class ArmstTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'unique value' do
    first = Armst.new(number: 2, decomp: [])
    first.save
    second = Armst.new(number: 2, decomp: [])
    second.validate
    assert_equal ['has already been taken'], second.errors[:number]
  end

  test 'good number' do
    first = Armst.new(decomp: [])
    first.validate
    assert_equal ["can't be blank"], first.errors[:number]
  end
end
