class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice] = "Connexion réussie!"
        redirect_to root_path

      else
        flash.now[:danger] = 'Email/mot de passe invalide'
        render 'new'
      end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end 
