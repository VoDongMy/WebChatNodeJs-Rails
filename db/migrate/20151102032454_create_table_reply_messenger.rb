class CreateTableReplyMessenger < ActiveRecord::Migration
  def self.up
    create_table :reply_messengers do |t|
    	t.integer :mess_id, null: false
    	t.integer :user_id, null: false
      	t.text :mess, null: false
      	t.timestamps null: false
    end
  end
  def self.down
      drop_table :reply_messengers
  end
end
