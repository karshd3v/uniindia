class AddColumnConstituencyIdToMlas < ActiveRecord::Migration
  def change
    add_column :mlas, :constituency_id, :integer
  end
end
