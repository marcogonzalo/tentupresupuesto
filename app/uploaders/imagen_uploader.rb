# encoding: utf-8

class ImagenUploader < CarrierWave::Uploader::Base
  before :store, :remember_cache_id
  after :retrieve_from_store, :delete_tmp_dir
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end
  
  def store_dir
    if Rails.env.development? or Rails.env.test?
      #"uploads/#{model.class.to_s.underscore}/#{model.owner.id.to_s}/galeria"
      "uploads/#{model.imagenable.class.to_s.underscore}/#{model.imagenable.id.to_s}/#{model.proposito.underscore}"
    else
      "uploads/imagenes/#{model.imagenable.class.to_s.underscore}/#{model.imagenable.id.to_s}/#{model.proposito.underscore}"
    end
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  process :resize_to_fit => [800,600]
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :mediana do
    process :resize_to_fit => [400,300]
  end
  
  version :mini, :from_version => :mediana do
    process :resize_to_fit => [200,150]
  end
  
  version :micro, :from_version => :mediana do
    process :resize_to_fit => [80,60]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    if original_filename
      md5 = Digest::MD5.hexdigest("#{model.imagenable.friendly_id}_#{Time.now}")
      "#{md5}.#{file.extension}"
    end
  end
  
  # store! nil's the cache_id after it finishes so we need to remember it for deletion
  def remember_cache_id(new_file)
    @cache_id_was = cache_id
  end
  
  def delete_tmp_dir(new_file)
    # make sure we don't delete other things accidentally by checking the name pattern
    if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
      FileUtils.rm_rf(File.join(root, cache_dir, @cache_id_was))
    end
  end
end
