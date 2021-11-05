require 'test_helper'

class HellosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hello = hellos(:one)
  end

  test 'should get index' do
    get hellos_url, as: :json
    assert_response :success
  end

  test 'should create hello' do
    assert_difference('Hello.count') do
      post hellos_url, params: { hello: { title: @hello.title } }, as: :json
    end

    assert_response 201
  end

  test 'should show hello' do
    get hello_url(@hello), as: :json
    assert_response :success
  end

  test 'should update hello' do
    patch hello_url(@hello), params: { hello: { title: @hello.title } }, as: :json
    assert_response 200
  end

  test 'should destroy hello' do
    assert_difference('Hello.count', -1) do
      delete hello_url(@hello), as: :json
    end

    assert_response 204
  end
end
