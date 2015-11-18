class RemoveAttachmentPictureToUser < ActiveRecord::Migration
  def change
    drop_attached_file :users, :picture
  end
end
