class AddcolumnstoComments < ActiveRecord::Migration
  def change
  	add_column :comments, :user_type, :string
  end
end
