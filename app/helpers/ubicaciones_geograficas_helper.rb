module UbicacionesGeograficasHelper
  def collection_select_entidad(instancia,atributo,entidad_superior_id)
    return collection_select(instancia, atributo, entidad_superior_id.nil? ? [] : UbicacionGeografica.find(entidad_superior_id).entidades.order('nombre ASC'), :id, :nombre, {}, { :include_blank => false })
  end
end
