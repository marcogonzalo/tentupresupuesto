module ProveedoresHelper
  def tipos_proveedor
    I18n.t("activerecord.attributes.proveedor.tipos_proveedor").map { |key, value| [ value, key ] }
  end
end
