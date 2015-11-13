class AddOnServerToGroupChat < ActiveRecord::Migration
  def change
  	add_column :group_chats , :on_server, :integer, null: false, default: 0,after: 'status'
  end
end
