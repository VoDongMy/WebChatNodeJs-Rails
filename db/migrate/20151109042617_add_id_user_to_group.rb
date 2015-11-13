class AddIdUserToGroup < ActiveRecord::Migration
  def change
  	add_column :group_chats , :user_id, :string, null: false, default: '0',after: 'title'
  end
end
