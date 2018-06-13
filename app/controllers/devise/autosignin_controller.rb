class Devise::AutosigninController < DeviseController
  include Devise::Autosigninable::Helpers

  def create
    sign_out(resource_name)
    resource = warden.authenticate!(scope: resource_name)

    if resource
      set_flash_message! :notice, :signed_in
    else
      set_flash_message! :alert, (warden.message || :invalid)
    end
    sign_in_and_redirect_to_url(resource, params[:return_to])
  end
end
