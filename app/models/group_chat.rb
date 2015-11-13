class GroupChat < ActiveRecord::Base
  has_many :usergroupchat, foreign_key: "group_id", class_name: "UserGroupChat"
  has_many :users, :through => :user_group_chats
  self.table_name = "group_chats"

    def self.createGroup(post_params)
      return GroupChat.create(post_params)
    end

    def self.updateGroup(id, post_params)
      return GroupChat.update(id,{on_server: 1})
    end


    def self.listChatRoom(user)
      return  userGroup = GroupChat.joins(:usergroupchat).where(" group_chats.user_id = ? OR user_group_chats.user_id = ?", user, user)
    end

    # def self.findMess(id,ip)
    #   @m = Messenger.joins(:user).select('users.last_name,users.first_name,messengers.*').find(id)
    #   if ip 
    #   	Messenger.update( id, {:ip => ip})
    #   end
    #   return @m
    # end
end
