class AddAttachmentProfilePicToMlas < ActiveRecord::Migration
  def self.up
    change_table :mlas do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    drop_attached_file :mlas, :profile_pic
  end
end
