module Account
  class TripsController < Account::Base

    def index
      @trips = current_user.trips.all
    end

    def new
      @trip = Trip.new
    end

    def create
      @trip = current_user.trips.build(trip_params)

      if @trip.save
        flash[:notice] = "Merci d'avoir créé une nouvelle prestation!"
        redirect_to home_path
      else
        flash[:alert] = "Désolé, nous n'avons pas pu créer votre nouvelle prestation. Veuillez réessayer!"
        render :new
      end
    end

    def edit
      @trip = Trip.find(params[:id])
    end

    def update
      @trip = current_user.trips.find(params[:id])

      @territory.update(territory_params)
      redirect_to trip_path(@trip)
    end

    private

    def trip_params
      params.require(:trip).permit(:name, :description, :category, :price_per_hour, :city, :policy, :picture)
    end
  end
end
