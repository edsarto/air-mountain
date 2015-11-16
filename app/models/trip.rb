class Trip < ActiveRecord::Base

  belongs_to :guide, class_name: "User", foreign_key: "guide_id"

  has_many :bookings, dependent: :destroy

  validates_presence_of :guide, :name, :city, :price_per_hour, :picture

  has_attached_file :picture,
    styles: { large: "1000x1000>", medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/


  def available_dates
    default_scope = Date.today.step(Date.today + 1.year).to_a
    return default_scope - self.reserved_dates
  end

  def available_between(starting_on, ending_on)
    dates = starting_on.step(ending_on).to_a.select do |day|
      reserved_dates.include?(day)
    end

    dates.size == 0
  end

  def reserved_dates
    dates = []

    self.bookings.each do |booking|
      unless booking.status == :canceled
        booking.starting_on.step(booking.ending_on).to_a.each do |day|
          dates << day
        end
      end
    end

    return dates.uniq.sort
  end
end
