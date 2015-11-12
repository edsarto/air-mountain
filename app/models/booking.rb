class Booking < ActiveRecord::Base

  belongs_to :client, class_name: "User", foreign_key: "client_id"
  belongs_to :guide, class_name: "User", foreign_key: "guide_id"

end
