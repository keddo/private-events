class SessionsController < ApplicationController
    def new 

    end

    def create
        @user = User.find_by(email: params[:session][:email])
        
        if @user && @user.password == params[:session][:password]
            session[:user_id] = @user.id
            flash[:success] = "Sucessfully login in!"
    end
    
    def destroy
    
    end
end
