class HomeController < ApplicationController
  def index
    @trips = Trip.limit(9).order("RANDOM()")
  end
end
