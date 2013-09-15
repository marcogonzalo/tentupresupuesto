#encoding: utf-8
class Usuario < ActiveRecord::Base    
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :encryptable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:password, :password_confirmation, :remember_me,
                  :perfilable_type, :perfilable_id, :acepta_terminos

  CAMPOS = ["email"]
  
  before_save :correct_perfilable_type

  belongs_to :perfilable, :polymorphic => true
  
  validates :email,
            :presence => true,
            :uniqueness => { :case_sensitive => false }
  validates :acepta_terminos, :acceptance  => { :accept => true, :message => "es obligatorio" }
  validates :perfilable_id, 
            :numericality =>  { 
                                :only_integer => true,
                                :greater_than => 0
                              }, 
            :allow_nil => true
  
  rails_admin do
  #   # You can copy this to a 'rails_admin do ... end' block inside your usuario.rb model definition

  #   # Found associations:

  #     configure :perfilable, :polymorphic_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :password_salt, :string         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :perfilable_id, :integer         # Hidden 
  #     configure :perfilable_type, :string         # Hidden 
  #     configure :nombre, :string 
  #     configure :sexo, :string 
  #     configure :fecha_nacimiento, :date 
  #     configure :activo, :boolean 
  #     configure :acepta_terminos, :boolean 
  #     configure :ultimo_pago, :datetime 
  #     configure :notificaciones, :boolean 
  #     configure :plan_beneficio, :string 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :confirmation_token, :string 
  #     configure :confirmed_at, :datetime 
  #     configure :confirmation_sent_at, :datetime 
  #     configure :unconfirmed_email, :string 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :authentication_token, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

      object_label_method :email     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

      list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
        sort_by :created_at           # Sort column (default is primary key)
        sort_reverse true     # Sort direction (default is true for primary key, last created first)
        field :id do
          column_width 50
        end
        field :email
        field :perfilable do
          column_width 100
        end
        field :perfilable_type do
          column_width 50
          visible true
          label "Tipo"
        end
        field :confirmed_at do
          date_format :abrev
        end
        field :updated_at do
          date_format :abrev
        end
      end
      
      show do
        configure :created_at do
          date_format :abrev
        end
        
        configure :updated_at do
          date_format :abrev
        end
      end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end
  
  def datos
    self.attributes.select { |key,v| CAMPOS.include?(key) }
  end

  def perfil
    unless self.perfilable_id.nil? or self.perfilable_id <= 0
		p = self.perfilable_type.classify.constantize.find(self.perfilable_id)
		return p
    end
  end
  
  def datos_y_perfil
    datos = self.datos
    perfil = self.perfil
    usu = {"datos"=> datos, "perfil"=> perfil}
    return usu
  end
  
  # Sobreescritura de acciones Devise
#  def password_required?
#    super if confirmed?
#  end

#  def password_match?
#    self.errors[:password] << "no puede quedar en blanco" if password.blank?
#    self.errors[:password_confirmation] << "no puede quedar en blanco " if password_confirmation.blank?
#    self.errors[:password_confirmation] << "no coincide la clave" if password != password_confirmation
#    password == password_confirmation && !password.blank?
#  end
  
  private
  def correct_perfilable_type
    self.perfilable_type = self.perfilable_type.capitalize unless self.perfilable_type.nil?
  end
end
