require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author" do
    assert_difference('Author.count') do
      post :create, author: { authorname: @author.authorname, class_name: @author.class_name, credit: @author.credit, department: @author.department, grade: @author.grade, mail: @author.mail, phone: @author.phone, project_id: @author.project_id, stunum: @author.stunum, user_id: @author.user_id }
    end

    assert_redirected_to author_path(assigns(:author))
  end

  test "should show author" do
    get :show, id: @author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @author
    assert_response :success
  end

  test "should update author" do
    put :update, id: @author, author: { authorname: @author.authorname, class_name: @author.class_name, credit: @author.credit, department: @author.department, grade: @author.grade, mail: @author.mail, phone: @author.phone, project_id: @author.project_id, stunum: @author.stunum, user_id: @author.user_id }
    assert_redirected_to author_path(assigns(:author))
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete :destroy, id: @author
    end

    assert_redirected_to authors_path
  end
end
