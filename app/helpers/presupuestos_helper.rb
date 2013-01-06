module PresupuestosHelper
  def motivos_rechazo
    I18n.t("activerecord.attributes.presupuesto.motivos_rechazo").map { |key, value| [ value, key ] }
  end
end
