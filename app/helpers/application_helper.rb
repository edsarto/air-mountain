module ApplicationHelper

  def owner_is_user(trip)
    current_user == trip.guide
  end

  def trip_bookings(current_user)
    bookings = []
    current_user.trips.each do |trip|
      trip.bookings.where(guide_archive: false).each do |booking|
        bookings << booking
      end
    end
    bookings.sort_by{ |booking| booking.created_at }.reverse!
  end

  def user_pict(user)
    if user.picture.exists?
      user.picture
    else
      "placeholder.png"
    end
  end
end
