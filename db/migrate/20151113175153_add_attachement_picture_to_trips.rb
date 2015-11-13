class AddAttachementPictureToTrips < ActiveRecord::Migration
  def self.up
    change_table :trips do |t|
      t.attachement :picture
    end
  end

  def self.down
    remove_attachement :trips, :picture
  end
end
