class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :name
      t.integer :setter_id
      t.integer :getter_id

      t.timestamps
    end
  end
end
