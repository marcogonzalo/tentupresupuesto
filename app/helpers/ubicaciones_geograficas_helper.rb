module UbicacionesGeograficasHelper
  def select_entidad(instancia,atributo,entidad_superior_id,tipo,prompt="--Selecciona--")
    unless atributo == :pais_id
      return select(instancia, atributo, (entidad_superior_id.nil? ? [] : UbicacionGeografica.find(entidad_superior_id).entidades.order('nombre ASC').collect {|ug| [ ug.nombre, ug.id ] }), { :include_blank => prompt })
    end
    return select(instancia, atributo, (UbicacionGeografica.where(:tipo => "pais").order('nombre ASC').collect {|ug| [ ug.nombre, ug.id ] }), { :include_blank => prompt, :selected => 1}, {:disabled => true })
  end
  
  def text_entidad(instancia,atributo,prompt="")
    if atributo == :localidad_id
      return text_field(instancia, atributo, {:value => prompt, "data-provide" => "typeahead" })
    end
  end
end
