#encoding: utf-8
venezuela= UbicacionGeografica.find_or_create_by_nombre('Venezuela', :tipo => 'pais', :entidad_id => nil)
if venezuela
  estado = nil
#1
  estado = UbicacionGeografica.find_or_create_by_nombre('Distrito Capital', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Libertador', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#2
  estado = UbicacionGeografica.find_or_create_by_nombre('Amazonas', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Alto Orinoco', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Atabapo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Atures', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Autana', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Manapiare', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Maroa', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Río Negro', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#3
  estado = UbicacionGeografica.find_or_create_by_nombre('Anzoátegui', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Anaco', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Aragua', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Bolívar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Bruzual', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cajigal', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Carvajal', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Diegop Bautista Urbaneja', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Freites', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Guanipa', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Guanta', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Independencia', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Libertad', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('McGregor', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Miranda', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Monagas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Peñalver', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Píritu', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Juan de Capistrano', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Santa Ana', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Simón Rodríguez', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sotillo', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#4
  estado = UbicacionGeografica.find_or_create_by_nombre('Apure', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Achaguas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Biruaca', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Muñoz', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Páez', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Pedro Camejo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Rómulo Gallegos', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Fernando', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#5
  estado = UbicacionGeografica.find_or_create_by_nombre('Aragua', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Bolívar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Camatagua', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Francisco Linares Alcántara', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Girardot', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('José Ángel Lamas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('José Félix Ribas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('José Rafael Revenga', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Libertador', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Mario Briceño Iragorry', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Ocumare de la Costa de Oro', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Casimiro', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Sebastián', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Santiago Mariño', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Santos Michelena', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Tovar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Urdaneta', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Zamora', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#6
  estado = UbicacionGeografica.find_or_create_by_nombre('Barinas', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Alberto Arvelo Torrealba', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Andrés Eloy Blanco', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Antonio José de Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Arismendi', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Barinas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Bolívar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cruz Paredes', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Ezequiel Zamora', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Obispos', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Pedraza', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Rojas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sosa', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#7
  estado = UbicacionGeografica.find_or_create_by_nombre('Bolívar', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Caroní', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cedeño', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('El Callao', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Heres', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Piar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Raúl Leoni', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Roscio', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sifontes', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Padre Pedro Chien', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#8
  estado = UbicacionGeografica.find_or_create_by_nombre('Carabobo', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Bejuma', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Carlos Arvelo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Diego Ibarra', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Guacara', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Juan José Mora', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Libertador', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Los Guayos', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Miranda', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Montalbán', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Naguanagua', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Puerto Cabello', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Diego', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Joaquín', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Valencia', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#9
  estado = UbicacionGeografica.find_or_create_by_nombre('Cojedes', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Anzoátegui', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Falcón', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Girardot', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Lima Blanco', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Pao de San Juan Bautista', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Ricaurte', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Rómulo Gallegos', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Carlos', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Tinaco', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#10
  estado = UbicacionGeografica.find_or_create_by_nombre('Delta Amacuro', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Antonio Díaz', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Casacoima', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Pedernales', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Tucupita', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#11
  estado = UbicacionGeografica.find_or_create_by_nombre('Falcón', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Acosta', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Bolívar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Buchivacoa', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cacique Manaure', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Carirubana', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Colina', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Dabajuro', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Democracia', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Falcón', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Federación', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Jacura', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Los Taques', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Mauroa', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Miranda', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Monseñor Iturriza', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Palmasola', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Petit', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Píritu', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Francisco', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Silva', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Tocópero', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Unión', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Urumaco', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Zamora', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#12
  estado = UbicacionGeografica.find_or_create_by_nombre('Guárico', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Camaguán', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Chaguaramas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('El Socorro', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sebastián Francisco de Miranda', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('José Félix Ribas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('José Tadeo Monagas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Juan Germán Roscio', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Julián Mellado', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Las Mercedes', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Leonardo Infante', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Pedro Zaraza', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Ortiz', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Gerónimo de Guayabal', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San José de Guaribe', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Santa María de Ipire', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#13
  estado = UbicacionGeografica.find_or_create_by_nombre('Lara', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Andrés Eloy Blanco', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Crespo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Iribarren', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Jiménez', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Morán', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Palavecino', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Simón Planas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Torres', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Urdaneta', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#14
  estado = UbicacionGeografica.find_or_create_by_nombre('Mérida', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Alberto Adriani', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Andrés Bello', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Antonio Pinto Salinas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Aricagua', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Arzobispo Chacón', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Campo Elías', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Caracciolo Parra Olmedo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cardenal Quintero', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Guaraque', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Julio César Salas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Justo Briceño', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Libertador', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Miranda', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Obispo Ramos de Lora', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Padre Noquera', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Pueblo Llano', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Rangel', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Rivas Dávila', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Santos Marquina', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Tovar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Tulio Febres Cordero', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Zea', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#15
  estado = UbicacionGeografica.find_or_create_by_nombre('Miranda', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Acevedo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Andrés Bello', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Baruta', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Brión', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Buroz', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Carrizal', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Chacao', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cristóbal Rojas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('El Hatillo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Guaicaipuro', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Independencia', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Lander', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Los Salias', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Páez', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Paz Castillo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Pedro Gual', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Plaza', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Simón Bolívar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Urdaneta', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Zamora', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#16
  estado = UbicacionGeografica.find_or_create_by_nombre('Monagas', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Acosta', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Aguasay', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Bolívar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Caripe', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cedeño', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Ezequiel Zamora', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Libertador', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Maturín', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Piar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Punceres', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Santa Bárbara', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sotillo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Uracoa', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#17
  estado = UbicacionGeografica.find_or_create_by_nombre('Nueva Esparta', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Antolín del Campo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Arismendi', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Díaz', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('García', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Gómez', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Maneiro', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Marcano', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Mariño', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Península de Macanao', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Tubores', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Villalba', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#18
  estado = UbicacionGeografica.find_or_create_by_nombre('Portuguesa', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Agua Blanca', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Araure', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Esteller', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Guanare', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Guanarito', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Monseñor José Vicente de Unda', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Ospino', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Páez', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Papelón', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Genaro de Boconoíto', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('SanRafael de Onoto', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Santa Rosalía', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Turén', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#19
  estado = UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Andrés Eloy Blanco', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Andrés Mata', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Arismendi', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Benítez', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Bermúdez', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Bolívar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cajigal', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cruz Salmerón Acosta', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Libertador', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Mariño', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Mejía', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Montes', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Ribero', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Valdez', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#20
  estado = UbicacionGeografica.find_or_create_by_nombre('Táchira', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Andrés Bello', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Antonio Rómulo Costa', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Ayacucho', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Bolívar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cárdenas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Córdoba', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Fernández Feo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Francisco de Miranda', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('García de Hevia', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Guásimos', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Independencia', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Jáuregui', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('José María Vargas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Junín', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Libertad', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Libertador', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Lobatera', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Michelena', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Panamericano', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Pedro María Ureña', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Rafael Urdaneta', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Samuel Darío Maldonado', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Cristóbal', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Seboruco', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Simón Rodríguez', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Torbes', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Uribante', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Judas Tadeo', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#21
  estado = UbicacionGeografica.find_or_create_by_nombre('Trujillo', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Andrés Bello', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Boconó', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Bolívar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Candelaria', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Carache', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Escuque', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('José Felipe Márquez Cañizález', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Juan Vicente Campos Elías', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('La Ceiba', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Miranda', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Monte Carmelo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Motatán', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Pampán', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Pampanito', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Rafael Rangel', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Rafael de Carvajal', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Trujillo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Urdaneta', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Valera', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#22
  estado = UbicacionGeografica.find_or_create_by_nombre('Vargas', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Vargas', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#23
  estado = UbicacionGeografica.find_or_create_by_nombre('Yaracuy', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Arístides Bastidas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Bolívar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Bruzual', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cocorote', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Independencia', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('José Antonio Páez', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('La Trinidad', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Manuel Monge', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Nirgua', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Peña', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Felipe', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Urachiche', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Veroes', :tipo => 'municipio', :entidad_id => estado.id)
  end
  estado = nil
#24
  estado = UbicacionGeografica.find_or_create_by_nombre('Zulia', :tipo => 'estado', :entidad_id => venezuela.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre('Almirante Padilla', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Baralt', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Cabimas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Catatumbo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Colón', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Francisco Javier Pulgar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Guajira', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Jesús Enrique Losada', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Jesús María Semprún', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('La Cañada de Urdaneta', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Lagunillas', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Machiques de Perijá', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Mara', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Maracaibo', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Miranda', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Rosario de Perijá', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('San Francisco', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Santa Rita', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Simón Bolívar', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Sucre', :tipo => 'municipio', :entidad_id => estado.id)
    UbicacionGeografica.find_or_create_by_nombre('Valmore Rodríguez', :tipo => 'municipio', :entidad_id => estado.id)
  end
end