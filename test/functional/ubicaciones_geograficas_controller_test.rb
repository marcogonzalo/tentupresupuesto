require 'test_helper'

class UbicacionesGeograficasControllerTest < ActionController::TestCase
  setup do
    @ubicacion_geografica = ubicaciones_geograficas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ubicaciones_geograficas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ubicacion_geografica" do
    assert_difference('UbicacionGeografica.count') do
      post :create, ubicacion_geografica: { nombre: @ubicacion_geografica.nombre, tipo: @ubicacion_geografica.tipo }
    end

    assert_redirected_to ubicacion_geografica_path(assigns(:ubicacion_geografica))
  end

  test "should show ubicacion_geografica" do
    get :show, id: @ubicacion_geografica
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ubicacion_geografica
    assert_response :success
  end

  test "should update ubicacion_geografica" do
    put :update, id: @ubicacion_geografica, ubicacion_geografica: { nombre: @ubicacion_geografica.nombre, tipo: @ubicacion_geografica.tipo }
    assert_redirected_to ubicacion_geografica_path(assigns(:ubicacion_geografica))
  end

  test "should destroy ubicacion_geografica" do
    assert_difference('UbicacionGeografica.count', -1) do
      delete :destroy, id: @ubicacion_geografica
    end

    assert_redirected_to ubicaciones_geograficas_path
  end
end
