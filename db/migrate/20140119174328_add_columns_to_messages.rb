class AddColumnsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :user_id, :integer
    add_column :messages, :user_type, :boolean, default: false
  end
end
