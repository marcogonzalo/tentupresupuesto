module TrabajosHelper
  def intenciones
    I18n.t("activerecord.attributes.trabajo.intenciones").map { |key, value| [ value, key ] }
  end
end
