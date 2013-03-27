# coding: utf-8
class Mensaje < ActiveRecord::Base
  attr_accessible :comentario, :usuario, :visto
  
  belongs_to :presupuesto
  
  USUARIO = ["solicitante","proveedor"]
  
  default_scope order('created_at ASC')
  
  validates :comentario,
            :length => { :in => 2..255 },
            :presence => true
  validates :usuario,
            :inclusion => { :in => USUARIO },
            :presence => true
  
  #ACCIONES
  
  def marcar_como_leido
    unless self.visto
      self.visto = true
      self.save()
    end
  end
  
  def leido
    self.visto ? "Leído" : "No leído"
  end
end
