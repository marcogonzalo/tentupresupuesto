# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.tentupresupuesto.com.ve"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  
  add '/proveedores', :changefreq => 'daily', :priority => 0.9
  Proveedor.find_each do |p|
    add perfil_proveedor_path(p.friendly_id), :changefreq => 'weekly', :priority => 0.75
  end
  Categoria.find_each do |cat|
    add listar_proveedores_path('categoria', cat.friendly_id), :priority => 0.6
  end
  for emp in Proveedor::TIPO_EMPRESA
    add listar_proveedores_path('tipo', emp), :priority => 0.6
  end
  UbicacionGeografica.where(:tipo => 'estado').find_each do |ug|
    add listar_proveedores_path('ubicacion', ug.friendly_id), :priority => 0.6
  end
  
  add '/trabajos', :changefreq => 'daily', :priority => 0.9
  Categoria.find_each do |cat|
    add listar_trabajos_path('categoria', cat.friendly_id), :priority => 0.6
  end
  UbicacionGeografica.where(:tipo => 'estado').find_each do |ug|
    add listar_trabajos_path('ubicacion', ug.friendly_id), :priority => 0.6
  end
end
