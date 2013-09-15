class GeneralController < ApplicationController
  layout :resolve_layout
  # before_filter :no_authenticated, :only => [:home]
  
  def home
    @categorias = Categoria.all
    cuenta = rand(Proveedor.count-3)
    @proveedores = Proveedor.limit(4).offset(cuenta)
  end
  
  def consejos_solicitante
  end
  
  def consejos_proveedor
  end
  
  def tyc
  end
  
  private
  def resolve_layout
    case action_name
    when "home"
      "landing"
    else
      "application"
    end
  end
end
