module UserHelper
	 
   def auth()
  		  if session[:user] && User.find(session[:user])
          return User.find(session[:user])
      	else
      	  return false
      	end
  	end

    def checkConfirmPass()
      if params[:confirm_password] && params[:password] && params[:password] === params[:confirm_password] 
        return true
      else
        return false
      end
      binding.pry
    end

  	def createSession(id)
		  reset_session
      user = User.find(id)
      User.updateOnOff(user.id, 1)
      session[:auth_token] = params[:authenticity_token]
      session[:user] = user.id
      session[:user_name] = user.first_name + user.last_name
      redirect_to user_chat_path
  	end
end
