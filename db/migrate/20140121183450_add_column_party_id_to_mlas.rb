class AddColumnPartyIdToMlas < ActiveRecord::Migration
  def change
    add_column :mlas, :party, :string
  end
end
