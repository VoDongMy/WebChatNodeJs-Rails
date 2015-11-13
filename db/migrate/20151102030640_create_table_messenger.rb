class CreateTableMessenger < ActiveRecord::Migration
  def self.up
    create_table :messengers do |t|
    	t.integer :user_one, null: false
    	t.integer :user_two, default: '0'
    	t.integer :group_id, default: '0'
    	t.string :title, default: 'nil'
      	t.text :mess
      	t.timestamps null: false
    end
  end

    def self.down
        drop_table :messengers
    end

end
