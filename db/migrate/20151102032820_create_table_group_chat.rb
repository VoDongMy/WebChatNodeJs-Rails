class CreateTableGroupChat < ActiveRecord::Migration
  def self.up
    create_table :group_chats do |t|
    	t.string :title, null: false, default: 'nil'
    	t.string :description, null: false, default: 'nil'
      t.timestamps null: false
    end
  end
  def self.down
      drop_table :group_chats
  end
end
