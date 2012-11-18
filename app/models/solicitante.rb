#encoding: utf-8
class Solicitante < ActiveRecord::Base
  attr_accessible :apellido, :nombre
  
  has_one :usuario, :as => :perfilable
end
