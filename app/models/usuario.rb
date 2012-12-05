#encoding: utf-8
class Usuario < ActiveRecord::Base
  CAMPOS = ["email","nombre","apellido","sexo","fecha_nacimiento","telefono_fijo","telefono_movil","telefono_alt"]
    
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :encryptable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :email_confirmation, :password, :password_confirmation, :remember_me,
                  :perfilable_type, :perfilable_id, :nombre, :apellido, :sexo, :fecha_nacimiento,
                  :telefono_local, :telefono_movil, :telefono_alt, :acepta_terminos

  belongs_to :perfilable, :polymorphic => true
  
  validates :nombre, 
            :length => { :in => 3..50 }, 
            :presence => true
  validates :apellido, 
            :length => { :in => 3..50 }, 
            :presence => true
  validates_columns :sexo # Debe comentarse cuando se haga un rake db:migrate
  validates :fecha_nacimiento,
            :timeliness =>  {
                              :on_or_before => lambda { 16.years.ago },
                              :type => :date,
                              :on_or_before_message => 'debe tener 16 años o más'
                            },
            :allow_blank => true
  validates :telefono_local, 
            :presence => { 
                          :message => "debe completarse si no posee teléfono móvil", 
                          :if => "telefono_movil.blank?"
                         },
            :format => { 
                          :with => /^(02)[0-9]{8,10}$/, 
                          :message => "tiene un formato inválido", 
                          :if => "!telefono_local.blank?" 
                       } 
  validates :telefono_movil, 
            :presence => { 
                          :message => "debe completarse si no posee teléfono local", 
                          :if => "telefono_local.blank?"
                         },
            :format => { 
                          :with => /^(04)(12|22|14|24|16|26)[0-9]{7,10}$/, 
                          :message => "tiene un formato inválido", 
                          :if => "!telefono_movil.blank?" 
                       } 
  validates :telefono_alt,
            :format => { 
                          :with => /^(((04)(12|22|14|24|16|26))|(02))[0-9]{7,10}$/, 
                          :message => "tiene un formato inválido", 
                          :if => "!telefono_alt.blank?"  
                       },
            :allow_blank => true
  validates :email, 
            :confirmation => true,
            :uniqueness => { :case_sensitive => false }
  validates :email_confirmation, :presence => true
  validates :acepta_terminos, :acceptance  => { :accept => true, :message => "es obligatorio" }
  validates :perfilable_id, 
            :numericality =>  { 
                                :only_integer => true,
                                :greater_than => 0
                              }, 
            :allow_nil => true
  def datos
    self.attributes.select { |key,v| CAMPOS.include?(key) }
  end

  def perfil
    unless self.perfilable_id.nil? or self.perfilable_id <= 0
      case self.perfilable_type
      when "solicitante"
        Solicitante.find(self.perfilable_id)
      when "proveedor"
        Proveedor.find(self.perfilable_id)
      else
        nil
      end
    end
  end
  
  def datos_y_perfil
    datos = self.datos
    perfil = self.perfil
    usu = {"datos"=> datos, "perfil"=> perfil}
    return usu
  end
end
