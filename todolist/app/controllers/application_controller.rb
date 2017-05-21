class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::MimeResponds
  # beacuse the user model has no controler in which 
  #we would permit it's params, we permit them here in the application controller.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    end
  # the function above can be named anything else.
  # this will basically run before going to the devis_controller which controles the
  # user model in our case. so we pass the any other custom attributes which were not
  # included in the devise user migration file.
end
