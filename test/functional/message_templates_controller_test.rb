require 'test_helper'

class MessageTemplatesControllerTest < ActionController::TestCase
  setup do
    @message_template = message_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:message_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create message_template" do
    assert_difference('MessageTemplate.count') do
      post :create, message_template: { formats: @message_template.formats, handlers: @message_template.handlers, locale: @message_template.locale, name: @message_template.name, partial: @message_template.partial, prefix: @message_template.prefix, source: @message_template.source }
    end

    assert_redirected_to message_template_path(assigns(:message_template))
  end

  test "should show message_template" do
    get :show, id: @message_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @message_template
    assert_response :success
  end

  test "should update message_template" do
    put :update, id: @message_template, message_template: { formats: @message_template.formats, handlers: @message_template.handlers, locale: @message_template.locale, name: @message_template.name, partial: @message_template.partial, prefix: @message_template.prefix, source: @message_template.source }
    assert_redirected_to message_template_path(assigns(:message_template))
  end

  test "should destroy message_template" do
    assert_difference('MessageTemplate.count', -1) do
      delete :destroy, id: @message_template
    end

    assert_redirected_to message_templates_path
  end
end
