module Genericas
  def self.validar_parametros_a_objeto_sin_localidad(instancia, parametros)
    parametros.delete :localidad_id
    instancia.attributes = parametros
    valido = instancia.valid?
    return valido
  end
end