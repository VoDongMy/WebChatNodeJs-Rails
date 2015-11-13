class AddStatusToGroupChat < ActiveRecord::Migration
  def change
  	add_column :group_chats , :status, :integer, null: false, default: 0,after: 'description'
  end
end
