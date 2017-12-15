class ShibbolethController < Devise::OmniauthCallbacksController
    def shibboleth
        @user = User.from_omniauth(request.env["omniauth.auth"])

        if @user.persisted?
            @user.update_data(request.env["omniauth.auth"])
            sign_in @user
            redirect_to root_path
        else
            @user.save
            @user.update_data(request.env["omniauth.auth"])
            sign_in @user
            session["devise.shibboleth_data"] = request.env["omniauth.auth"]
            redirect_to root_path
        end
    end

    def failure
        redirect_to root_path
    end
end
