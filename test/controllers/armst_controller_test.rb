require './test/test_helper.rb'

class ArmstControllerTest < ActionDispatch::IntegrationTest

  test 'test_record_in_db' do
    before = Armst.count
    get "http://localhost:3000/armst/view", params: { v1: 3 }
    after = Armst.count

    assert_equal before + 1, after
  end

end
