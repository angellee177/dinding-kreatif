class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    def current_user
        if session[:user_id]
            User.find(session[:user_id])
        else
            nil
        end
    end

    # Check If user Login Or Not
    def logged_in?
        !!current_user
    end

    # If user aren't login
    def require_user
        if current_user
            true
        else
            redirect_to new_session_path, notice: 'Silakan Login Terlebih Dahulu'
            return false
        end
    end

end
