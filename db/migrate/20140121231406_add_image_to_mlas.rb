class AddImageToMlas < ActiveRecord::Migration
  def change
    add_column :mlas, :image_id, :integer
  end
end
