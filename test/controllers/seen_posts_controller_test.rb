require 'test_helper'

class SeenPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get seen_new_post_url
    assert_response :success
  end

end
