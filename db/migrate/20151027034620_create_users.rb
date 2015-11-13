class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
    	t.string :last_name, default: 'nil'
    	t.string :first_name, null: false, default: 'nil'
    	t.string :email_login, null: false, default: 'nil'
    	t.integer :company_id, default: '0'
    	t.integer :group_id, default: '0'
    	t.date :birthday, default: '0000-00-00'
    	t.string :avatar, default: 'nil'
    	t.string :tell, default: 'nil'
    	t.string :google_id, default: 'nil'
    	t.string :password, null: false
    	t.string :active_code,default: 'nil'
    	t.integer :status, null: false
      	t.timestamps null: false
    end
  end
	def self.down
		drop_table :users
	end
end
