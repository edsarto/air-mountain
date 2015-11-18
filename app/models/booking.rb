class Booking < ActiveRecord::Base

  belongs_to :client, class_name: "User", foreign_key: "client_id"
  belongs_to :guide, class_name: "User", foreign_key: "guide_id"

  belongs_to :trip

  validates_presence_of :client, :owner, :starting_on, :ending_on, :status

  def self.start_date_after_end_date?(starting_on, ending_on)
    starting_on > ending_on
  end

  def self.booked?(trip_id, starting_on, ending_on)
    @bookings = Booking.where(trip_id: trip_id)

    if @bookings.empty?
      return false
    else
      @bookings.each do |booking|
        if booking.starting_on.nil? || booking.starting_on == 0
          return false
        elsif booking.starting_on <= starting_on && starting_on <= booking.ending_on
          return true
        elsif starting_on <= booking.starting_on && booking.starting_on <= ending_on
          return true
        elsif starting_on <= booking.starting_on && booking.ending_on <= ending_on
          return true
        else
          return false
        end
      end
    end
  end

  private

  def date_must_be_in_future
    if self.starting_on < Date.today
      errors.add(:starting_on, :invalid)
    end
  end
end
