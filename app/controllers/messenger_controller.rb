# encoding: utf-8
# content
class MessengerController < ApplicationController
	layout "chatApp"
	include UserHelper

	def saveMess
	  	if auth() && params[:contentMessage]
	  		group = GroupChat.find_by description: params[:group]
	  		@m = Messenger.newMess(user_one: auth().id, group_id: group.id,mess: params[:contentMessage],ip: params[:ip])
	  		render json: { success: true, id: @m.id, roomId: group.description }
	    else
	      	render json: { success: false}
	    end
  	end


  	def findMessage
  		@m = Messenger.findMess(params[:id],params[:ip])
	  	if  auth() && @m && UserGroupChat.checkUserInGroup( @m.group_id, session[:user])
	  		dataAppend = render_to_string(:template => 'chat/dataAppendMess', :layout => false)
	  		render json: { success: true, id: params[:id], dataAppend: dataAppend.force_encoding("UTF-8"), userMessengerId: @m.user_one}
	    else
	      	render json: { success: false}
	    end
  	end
end