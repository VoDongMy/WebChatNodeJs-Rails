class Messenger < ActiveRecord::Base
	belongs_to :user, foreign_key: "user_one", class_name: "User"
  	self.table_name = "messengers"

    def self.getGroupMessenger(groupId)
      return Messenger.joins(:user).select('users.last_name,users.first_name,messengers.*').where({group_id: groupId}).group('messengers.id').all
    end

    def self.newMess(post_params)
      return Messenger.create(post_params)
    end

    def self.findMess(id,ip)
      @m = Messenger.joins(:user).select('users.last_name,users.first_name,messengers.*').find(id)
      if ip 
      	Messenger.update( id, {:ip => ip})
      end
      return @m
    end
end