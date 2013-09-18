# coding: utf-8
class Mensaje < ActiveRecord::Base
  attr_accessible :comentario, :usuario, :visto
  
  belongs_to :presupuesto
  
  USUARIO = ["solicitante","proveedor","Solicitante","Proveedor"]
  
  default_scope order('created_at ASC')
  
  validates :comentario,
            :length => { :in => 2..255 },
            :presence => true
  validates :usuario,
            :inclusion => { :in => USUARIO },
            :presence => true
  
  rails_admin do
  #   # You can copy this to a 'rails_admin do ... end' block inside your mensaje.rb model definition

  #   # Found associations:

  #     configure :presupuesto, :belongs_to_association

  #   # Found columns:

  #     configure :id, :integer
  #     configure :comentario, :string
  #     configure :usuario, :string
  #     configure :visto, :boolean
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime
  #     configure :presupuesto_id, :integer         # Hidden

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

    list do
    #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
    #       # items_per_page 100    # Override default_items_per_page
    #       # sort_by :id           # Sort column (default is primary key)
    #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
      field :presupuesto do
        column_width 100
      end
      field :usuario do
        column_width 100
      end
      field :comentario
      field :created_at do
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
