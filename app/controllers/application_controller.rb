# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[home]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number])
  end
end
