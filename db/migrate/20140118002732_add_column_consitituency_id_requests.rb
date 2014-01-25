class AddColumnConsitituencyIdRequests < ActiveRecord::Migration
  def change
    add_column :requests, :constituency_id, :integer
  end
end
