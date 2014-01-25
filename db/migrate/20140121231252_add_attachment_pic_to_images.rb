class AddAttachmentPicToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :pic
    end
  end

  def self.down
    drop_attached_file :images, :pic
  end
end
