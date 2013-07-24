class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      respond_to do |format|
        format.html { redirect_back_or user }
        format.xml { 
           render :xml => user
        }
        format.json {
           output = Hash.new
           output['remember_token'] = user[:remember_token]
           output['id'] = user[:id]
 	   render :json => output 
 	}
      end
 
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
