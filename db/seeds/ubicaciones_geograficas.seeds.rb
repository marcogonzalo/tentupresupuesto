#encoding: utf-8
pais= UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Venezuela', :tipo => 'pais', :entidad_id => nil)
if pais
  estado = nil
#1
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Distrito Capital', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Libertador', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#2
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Amazonas', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Alto Orinoco', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Atabapo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Atures', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Autana', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Manapiare', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Maroa', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Río Negro', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#3
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Anzoátegui', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Anaco', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Aragua', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bolívar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bruzual', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cajigal', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Carvajal', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Diegop Bautista Urbaneja', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Freites', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Guanipa', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Guanta', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Independencia', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Libertad', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('McGregor', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Miranda', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Monagas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Peñalver', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Píritu', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Juan de Capistrano', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Santa Ana', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Simón Rodríguez', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sotillo', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#4
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Apure', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Achaguas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Biruaca', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Muñoz', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Páez', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Pedro Camejo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Rómulo Gallegos', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Fernando', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#5
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Aragua', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bolívar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Camatagua', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Francisco Linares Alcántara', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Girardot', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('José Ángel Lamas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('José Félix Ribas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('José Rafael Revenga', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Libertador', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Mario Briceño Iragorry', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Ocumare de la Costa de Oro', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Casimiro', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Sebastián', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Santiago Mariño', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Santos Michelena', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Tovar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Urdaneta', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Zamora', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#6
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Barinas', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Alberto Arvelo Torrealba', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Andrés Eloy Blanco', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Antonio José de Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Arismendi', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Barinas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bolívar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cruz Paredes', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Ezequiel Zamora', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Obispos', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Pedraza', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Rojas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sosa', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#7
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bolívar', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Caroní', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cedeño', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('El Callao', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Heres', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Piar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Raúl Leoni', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Roscio', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sifontes', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Padre Pedro Chien', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#8
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Carabobo', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bejuma', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Carlos Arvelo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Diego Ibarra', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Guacara', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Juan José Mora', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Libertador', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Los Guayos', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Miranda', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Montalbán', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Naguanagua', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Puerto Cabello', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Diego', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Joaquín', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Valencia', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#9
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cojedes', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Anzoátegui', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Falcón', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Girardot', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Lima Blanco', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Pao de San Juan Bautista', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Ricaurte', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Rómulo Gallegos', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Carlos', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Tinaco', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#10
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Delta Amacuro', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Antonio Díaz', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Casacoima', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Pedernales', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Tucupita', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#11
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Falcón', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Acosta', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bolívar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Buchivacoa', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cacique Manaure', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Carirubana', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Colina', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Dabajuro', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Democracia', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Falcón', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Federación', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Jacura', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Los Taques', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Mauroa', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Miranda', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Monseñor Iturriza', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Palmasola', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Petit', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Píritu', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Francisco', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Silva', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Tocópero', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Unión', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Urumaco', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Zamora', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#12
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Guárico', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Camaguán', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Chaguaramas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('El Socorro', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sebastián Francisco de Miranda', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('José Félix Ribas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('José Tadeo Monagas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Juan Germán Roscio', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Julián Mellado', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Las Mercedes', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Leonardo Infante', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Pedro Zaraza', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Ortiz', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Gerónimo de Guayabal', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San José de Guaribe', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Santa María de Ipire', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#13
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Lara', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Andrés Eloy Blanco', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Crespo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Iribarren', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Jiménez', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Morán', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Palavecino', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Simón Planas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Torres', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Urdaneta', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#14
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Mérida', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Alberto Adriani', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Andrés Bello', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Antonio Pinto Salinas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Aricagua', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Arzobispo Chacón', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Campo Elías', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Caracciolo Parra Olmedo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cardenal Quintero', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Guaraque', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Julio César Salas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Justo Briceño', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Libertador', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Miranda', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Obispo Ramos de Lora', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Padre Noquera', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Pueblo Llano', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Rangel', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Rivas Dávila', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Santos Marquina', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Tovar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Tulio Febres Cordero', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Zea', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#15
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Miranda', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Acevedo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Andrés Bello', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Baruta', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Brión', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Buroz', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Carrizal', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Chacao', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cristóbal Rojas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('El Hatillo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Guaicaipuro', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Independencia', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Lander', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Los Salias', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Páez', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Paz Castillo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Pedro Gual', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Plaza', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Simón Bolívar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Urdaneta', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Zamora', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#16
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Monagas', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Acosta', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Aguasay', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bolívar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Caripe', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cedeño', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Ezequiel Zamora', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Libertador', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Maturín', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Piar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Punceres', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Santa Bárbara', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sotillo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Uracoa', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#17
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Nueva Esparta', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Antolín del Campo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Arismendi', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Díaz', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('García', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Gómez', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Maneiro', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Marcano', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Mariño', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Península de Macanao', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Tubores', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Villalba', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#18
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Portuguesa', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Agua Blanca', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Araure', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Esteller', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Guanare', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Guanarito', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Monseñor José Vicente de Unda', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Ospino', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Páez', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Papelón', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Genaro de Boconoíto', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('SanRafael de Onoto', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Santa Rosalía', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Turén', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#19
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Andrés Eloy Blanco', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Andrés Mata', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Arismendi', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Benítez', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bermúdez', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bolívar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cajigal', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cruz Salmerón Acosta', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Libertador', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Mariño', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Mejía', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Montes', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Ribero', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Valdez', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#20
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Táchira', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Andrés Bello', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Antonio Rómulo Costa', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Ayacucho', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bolívar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cárdenas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Córdoba', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Fernández Feo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Francisco de Miranda', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('García de Hevia', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Guásimos', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Independencia', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Jáuregui', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('José María Vargas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Junín', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Libertad', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Libertador', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Lobatera', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Michelena', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Panamericano', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Pedro María Ureña', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Rafael Urdaneta', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Samuel Darío Maldonado', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Cristóbal', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Seboruco', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Simón Rodríguez', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Torbes', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Uribante', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Judas Tadeo', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#21
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Trujillo', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Andrés Bello', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Boconó', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bolívar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Candelaria', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Carache', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Escuque', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('José Felipe Márquez Cañizález', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Juan Vicente Campos Elías', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('La Ceiba', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Miranda', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Monte Carmelo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Motatán', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Pampán', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Pampanito', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Rafael Rangel', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Rafael de Carvajal', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Trujillo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Urdaneta', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Valera', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#22
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Vargas', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Vargas', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#23
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Yaracuy', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Arístides Bastidas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bolívar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Bruzual', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cocorote', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Independencia', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('José Antonio Páez', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('La Trinidad', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Manuel Monge', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Nirgua', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Peña', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Felipe', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Urachiche', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Veroes', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
  estado = nil
#24
  estado = UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Zulia', :tipo => 'estado', :entidad_id => pais.id)
  if estado
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Almirante Padilla', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Baralt', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Cabimas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Catatumbo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Colón', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Francisco Javier Pulgar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Guajira', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Jesús Enrique Losada', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Jesús María Semprún', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('La Cañada de Urdaneta', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Lagunillas', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Machiques de Perijá', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Mara', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Maracaibo', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Miranda', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Rosario de Perijá', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('San Francisco', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Santa Rita', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Simón Bolívar', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Sucre', :tipo => 'municipio', :entidad_id =>  estado.id)
    UbicacionGeografica.find_or_create_by_nombre_and_entidad_id('Valmore Rodríguez', :tipo => 'municipio', :entidad_id =>  estado.id)
  end
end