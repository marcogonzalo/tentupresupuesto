#encoding: utf-8
class Usuario < ActiveRecord::Base    
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :encryptable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:password, :password_confirmation, :remember_me,
                  :perfilable_type, :perfilable_id, :nombre, :apellido, :sexo, :fecha_nacimiento, :acepta_terminos

  SEXO = ["masculino", "femenino"] # Constante para valores de sexo
  CAMPOS = ["email","nombre","apellido","sexo","fecha_nacimiento"]

  belongs_to :perfilable, :polymorphic => true
  
  validates :nombre, 
            :length => { :in => 3..50 }, 
            :presence => true
  validates :sexo,
            :inclusion => { :in => SEXO},
            :allow_blank => true 
  validates :fecha_nacimiento,
            :timeliness =>  {
                              :on_or_before => lambda { 16.years.ago },
                              :type => :date,
                              :on_or_before_message => 'debe tener 16 años o más'
                            },
            :allow_blank => true
  validates :email,
            :uniqueness => { :case_sensitive => false }
  #validates :acepta_terminos, :acceptance  => { :accept => true, :message => "es obligatorio" }
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
  
  # Sobreescritura de acciones Devise
  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << "no puede quedar en blanco" if password.blank?
    self.errors[:password_confirmation] << "no puede quedar en blanco " if password_confirmation.blank?
    self.errors[:password_confirmation] << "no coincide la clave" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end
end
