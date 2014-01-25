class AddColumnArchiveToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :is_archive, :boolean, default: false
  end
end
