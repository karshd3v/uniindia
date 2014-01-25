class Addcolumntomlas < ActiveRecord::Migration
  def change
  	add_column :mlas, :name, :string
    add_column :mlas, :phone_number, :string
    add_column :mlas, :address, :text
  end
end
