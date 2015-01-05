require 'test_helper'

class SrmBundlesControllerTest < ActionController::TestCase
  setup do
    @srm_bundle = srm_bundles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:srm_bundles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create srm_bundle" do
    assert_difference('SrmBundle.count') do
      post :create, srm_bundle: { bundle_id: @srm_bundle.bundle_id }
    end

    assert_redirected_to srm_bundle_path(assigns(:srm_bundle))
  end

  test "should show srm_bundle" do
    get :show, id: @srm_bundle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @srm_bundle
    assert_response :success
  end

  test "should update srm_bundle" do
    patch :update, id: @srm_bundle, srm_bundle: { bundle_id: @srm_bundle.bundle_id }
    assert_redirected_to srm_bundle_path(assigns(:srm_bundle))
  end

  test "should destroy srm_bundle" do
    assert_difference('SrmBundle.count', -1) do
      delete :destroy, id: @srm_bundle
    end

    assert_redirected_to srm_bundles_path
  end
end
