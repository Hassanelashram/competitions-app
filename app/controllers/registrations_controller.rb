class RegistrationsController < Devise::RegistrationsController
    def create
      build_resource(sign_up_params)
      
      resource.save
      Referrals::CreateReferralJob.perform_now(params[:user][:referrer].to_i, resource.id)
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end

    def update
        self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
        prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    
        resource_updated = update_resource(resource, account_update_params)
        yield resource if block_given?
        if resource_updated
          set_flash_message_for_update(resource, prev_unconfirmed_email)
          bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?
    
          respond_with resource, location: after_update_path_for(resource)
        else    
          clean_up_passwords resource
          set_minimum_password_length
          
          redirect_to dashboard_path(params: { partial: "settings" }), alert: "Confirm your current password"
        end
      end

    protected
    # def sign_up_params
    #   params.require(:user).permit(:first_name, :referred_by)
    # end

    def update_resource(resource, params)
      resource.update_without_password(params)
    end

    def after_update_path_for(resource)
        dashboard_path(params: { partial: "overview" })
    end
end