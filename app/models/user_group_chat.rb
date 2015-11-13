class UserGroupChat < ActiveRecord::Base
	belongs_to :user
  	belongs_to :groupchat
  	self.table_name = "user_group_chats"

  	def self.createUserGroup(group, user)
      return UserGroupChat.create(group_id: group, user_id: user, status: 1)
    end

    def self.checkUserInGroup(group,user)
      if (group == 1) 
        return true
      end 
      userGroup = UserGroupChat.where({group_id: group, user_id: user,  status: 1}).first
		  group = GroupChat.where({id: group, user_id: user}).first
    	if userGroup.nil? && group.nil?
    		return false
    	elsif userGroup.nil? || group.nil? 
    		return true
    	else
    		return false
    	end
    end

    def self.checkUserGroup(user1,user2)
    	key1 = Digest::SHA1.hexdigest(user1.to_s+user2.to_s)
	  	group1 = GroupChat.find_by description: key1
	  	key2 = Digest::SHA1.hexdigest(user2.to_s+user1.to_s)
	  	group2 = GroupChat.find_by description: key2
	  	if !group1.nil?
	  		return group1
	  	elsif group2.nil?
	  		return group = nil
	  	else
	  		return group2
	  	end
    end




end
