class ChatController < ApplicationController
	require 'digest/sha1'
	layout "chatApp"
	include UserHelper

	def chat
	  	if auth()
	  		@group = 'nil'
	  		@mess = Messenger.getGroupMessenger(1)
	  		render :chat
	    else
	      redirect_to root_path
	    end
  	end

	def getMess
	  	if auth()
	  		render :chat
	    else
	      redirect_to root_path
	    end
  	end

	def listUser
	  	if auth()
	  		@title = 'Private Chat'
	  		@userAll = User.all
	  		render :privateChat
	    else
	      redirect_to root_path
	    end
  	end

	def getRoomServer
	  	if auth()
	  		render json: { success: true, listGroup: GroupChat.listChatRoom(session[:user])}
	    else
	     	render json: { success: false }
	    end
  	end

	def updateRoomServer
	  	if auth() 
	  		if GroupChat.updateGroup(params[:id], params[:dataUpdate])
	  		render json: { success: true }
	  		end
	    else
	     	render json: { success: false }
	    end
  	end

	def privateRoom
		group = GroupChat.find_by description: params[:id]
	  	if auth() && group && UserGroupChat.checkUserInGroup( group.id, session[:user])
	  		userTwo = User.find((UserGroupChat.find_by group_id: group.id).user_id)
	  		@title = userTwo.first_name+userTwo.last_name
	  		@mess = Messenger.getGroupMessenger(group.id)
	  		@group = group.description
	  		render :chat
	    else
	      redirect_to root_path
	    end
  	end

	def group
	  	if auth() 
	  		@group = GroupChat.where({prent_id: 1}).all
	  		render :groupChat
	    else
	      redirect_to root_path
	    end
  	end

	def createChatRoom
	  	if (auth() && User.find(params[:id]))
	  		group = UserGroupChat.checkUserGroup(session[:user],params[:id])
	  		if(group.nil?)
		    	key  = Digest::SHA1.hexdigest(session[:user].to_s+params[:id].to_s)
			  	group =	GroupChat.createGroup(description: key, user_id: session[:user], prent_id: 0)
			    listGroup = UserGroupChat.createUserGroup(group.id,params[:id])
			    render json: { success: true, description: key, listGroup: listGroup,location: url_for(controller: 'chat', action:'privateRoom',params: {id:group.description})}
			else
				render json: { success: true, description: group.description,location: url_for(controller: 'chat', action:'privateRoom',params: {id:group.description})}
			end	    
	    else
	      redirect_to root_path
	    end
  	end
end
