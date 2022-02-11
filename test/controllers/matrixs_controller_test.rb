require "test_helper"

class MatrixsControllerTest < ActionDispatch::IntegrationTest
  test "should get sub_matrix" do
    get matrixs_sub_matrix_url
    assert_response :success
  end
end
