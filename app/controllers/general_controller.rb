class GeneralController < ApplicationController
  layout :resolve_layout
  
  def home
  end
  
  private
  def resolve_layout
    case action_name
    when "home"
      "landing"
    else
      "application"
    end
  end
end
