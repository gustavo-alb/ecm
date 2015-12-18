require 'test_helper'

class TipoCatalogosControllerTest < ActionController::TestCase
  setup do
    @tipo_catalogo = tipo_catalogos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_catalogos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_catalogo" do
    assert_difference('TipoCatalogo.count') do
      post :create, tipo_catalogo: { ativo: @tipo_catalogo.ativo, nome: @tipo_catalogo.nome }
    end

    assert_redirected_to tipo_catalogo_path(assigns(:tipo_catalogo))
  end

  test "should show tipo_catalogo" do
    get :show, id: @tipo_catalogo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_catalogo
    assert_response :success
  end

  test "should update tipo_catalogo" do
    patch :update, id: @tipo_catalogo, tipo_catalogo: { ativo: @tipo_catalogo.ativo, nome: @tipo_catalogo.nome }
    assert_redirected_to tipo_catalogo_path(assigns(:tipo_catalogo))
  end

  test "should destroy tipo_catalogo" do
    assert_difference('TipoCatalogo.count', -1) do
      delete :destroy, id: @tipo_catalogo
    end

    assert_redirected_to tipo_catalogos_path
  end
end
