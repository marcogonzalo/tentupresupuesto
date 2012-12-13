require 'test_helper'

class PresupuestosControllerTest < ActionController::TestCase
  setup do
    @presupuesto = presupuestos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presupuestos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create presupuesto" do
    assert_difference('Presupuesto.count') do
      post :create, presupuesto: { aprobado: @presupuesto.aprobado, con_iva: @presupuesto.con_iva, motivo_rechazo: @presupuesto.motivo_rechazo, precio_maximo: @presupuesto.precio_maximo, precio_minimo: @presupuesto.precio_minimo, rechazado: @presupuesto.rechazado, resumen: @presupuesto.resumen, visto: @presupuesto.visto }
    end

    assert_redirected_to presupuesto_path(assigns(:presupuesto))
  end

  test "should show presupuesto" do
    get :show, id: @presupuesto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @presupuesto
    assert_response :success
  end

  test "should update presupuesto" do
    put :update, id: @presupuesto, presupuesto: { aprobado: @presupuesto.aprobado, con_iva: @presupuesto.con_iva, motivo_rechazo: @presupuesto.motivo_rechazo, precio_maximo: @presupuesto.precio_maximo, precio_minimo: @presupuesto.precio_minimo, rechazado: @presupuesto.rechazado, resumen: @presupuesto.resumen, visto: @presupuesto.visto }
    assert_redirected_to presupuesto_path(assigns(:presupuesto))
  end

  test "should destroy presupuesto" do
    assert_difference('Presupuesto.count', -1) do
      delete :destroy, id: @presupuesto
    end

    assert_redirected_to presupuestos_path
  end
end
