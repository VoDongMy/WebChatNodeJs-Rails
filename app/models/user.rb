class User < ActiveRecord::Base
	require 'digest/sha1'
	has_many :usergroupchat
  	has_many :groupchats, :through => :user_group_chats
	self.table_name = "users"

	def self.checkUser(email,pass)

	  # return User.where("email_login = ? and password = ?", email, Digest::SHA1.hexdigest(pass)).first
	  return User.where({email_login: email, password: Digest::SHA1.hexdigest(pass)}).first
	end

	def self.createUser(post_params)
    	User.create(post_params)
  	end

  	def self.checkCreateUser(email)
	  return User.where("email_login = ?", email).first
	end

	def self.updateOnOff(id, onOff)
		return	User.find(id).update_columns(status: onOff)
  	end

end
