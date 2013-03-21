class Imagen < ActiveRecord::Base
  mount_uploader :archivo, ImagenUploader
  
  attr_accessible :archivo, :descripcion, :imagenable_id, :imagenable_type, :proposito
  
  belongs_to :imagenable, :polymorphic => true
  
end
