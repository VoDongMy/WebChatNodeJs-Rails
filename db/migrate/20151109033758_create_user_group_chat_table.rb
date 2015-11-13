class CreateUserGroupChatTable < ActiveRecord::Migration
  def change
    create_table :user_group_chats do |t|
    	t.integer :group_id, default: '0'
    	t.integer :user_id, default: '0'
    	t.integer :status, default: '0'
    end
  end
end
