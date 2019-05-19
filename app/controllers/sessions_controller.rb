class SessionsController < ApplicationController
    def new
    end

    def create 
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.user_id
            flash[:success] = "You Have Logged In"
            redirect_to users_path(user)
        else
            flash.now[:danger] = "There was something wrong with your Login Information"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "You Have Logged Out"
        redirect_to root_path
    end
end