class OmniauthController < ApplicationController
    
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
        
        if @user.persisted?
            sign_in_and_redirect @user
        else
            flash[:error] = "did not work"
            redirect_to new_user_registration_path
        end
    end

    def failure
    end
end

