class AddColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commentee_id, :integer
    add_column :comments, :commentee_type, :string
    add_column :comments, :request_id, :integer
  end
end
