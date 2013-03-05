class GeneralController < ApplicationController
  layout :resolve_layout
  before_filter :no_authenticated, :only => [:home]
  
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
