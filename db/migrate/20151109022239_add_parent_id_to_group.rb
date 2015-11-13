#rails generate migration AddParentIdToGroup
class AddParentIdToGroup < ActiveRecord::Migration
  def change
  	add_column :group_chats, :prent_id, :string, null: false, default: '0',after: 'title'
  end
end
