class AddIpToMessenger < ActiveRecord::Migration
  def self.up
  	add_column :messengers, :ip, :string, null: false, default: '0.0.0.0',after: 'title'
  end
end
