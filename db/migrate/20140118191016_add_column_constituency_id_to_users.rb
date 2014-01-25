class AddColumnConstituencyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :constituency_id, :integer
  end
end
