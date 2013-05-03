class AgregarEnlacesWebEnProveedores < ActiveRecord::Migration
  def up
    change_table :proveedores do |t|
      t.string :web_url
      t.string :twitter_url
      t.string :facebook_url
      t.string :google_url
      t.string :linkedin_url
      t.string :youtube_url
      t.string :pinterest_url
      t.string :instagram_url
    end
  end

  def down
    remove_column :proveedores, :web_url
    remove_column :proveedores, :twitter_url
    remove_column :proveedores, :facebook_url
    remove_column :proveedores, :google_url
    remove_column :proveedores, :linkedin_url
    remove_column :proveedores, :youtube_url
    remove_column :proveedores, :pinterest_url
    remove_column :proveedores, :instagram_url
  end
end
