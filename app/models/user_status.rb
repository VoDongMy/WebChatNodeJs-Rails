class UserStatus < ActiveRecord::Base
	belongs_to :user
  	self.table_name = "user_statuses"

  	def self.userStatus(post_params)
      return UserStatus.create(post_params)
    end

  	def self.checkStatus(id)
      return UserStatus.where({user_id: 9}).count
    end

  	def self.deleteStatus(id,socketId)
  		return UserStatus.where({user_id: id, socket_id: socketId}).destroy_all
    end

end
