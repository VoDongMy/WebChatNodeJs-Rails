class CreateUserStatuses < ActiveRecord::Migration
  def change
    create_table :user_statuses do |t|
    	t.integer :user_id, default: 0
    	t.string :socket_id,default: 'nil'
    	t.integer :status, null: false, default: 0
    	t.timestamps null: false
      t.timestamps null: false
    end
  end
end
