class CreateTableGroupUser < ActiveRecord::Migration
  def self.up
    create_table :group_users do |t|
    	t.string :title, null: false, default: 'user'
    	t.text :desription, null: true
    end
  end
  def self.dowm
  end
end
