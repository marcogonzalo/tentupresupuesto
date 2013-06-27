class Imagen < ActiveRecord::Base
  mount_uploader :archivo, ImagenUploader
  
  attr_accessible :archivo, :descripcion, :imagenable_id, :imagenable_type, :proposito
  
  belongs_to :imagenable, :polymorphic => true
  
  rails_admin do
  #   # You can copy this to a 'rails_admin do ... end' block inside your imagen.rb model definition

  #   # Found associations:

  #     configure :imagenable, :polymorphic_association

  #   # Found columns:

  #     configure :id, :integer
  #     configure :archivo, :carrierwave
  #     configure :descripcion, :string
  #     configure :proposito, :string
  #     configure :imagenable_id, :integer         # Hidden
  #     configure :imagenable_type, :string         # Hidden
  #     configure :created_at, :datetime
  #     configure :updated_at, :datetime

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
      field :archivo
      field :descripcion
      field :proposito
      field :imagenable do
        column_width 100
      end
      field :created_at do
        date_format :abrev
      end
    end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  end
end
