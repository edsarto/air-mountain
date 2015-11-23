module Account
  class TripsController < Account::Base
    include Pundit

    after_action :verify_authorized, except: [:index, :show]

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def index
      @trips = current_user.trips.all
    end

    def new
      @trip = Trip.new
      authorize @trip
    end

    def create
      @trip = current_user.trips.build(trip_params)
      authorize @trip

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
      authorize @trip
    end

    def update
      @trip = current_user.trips.find(params[:id])
      authorize @trip

      @territory.update(territory_params)
      redirect_to trip_path(@trip)
    end

    private

    def user_not_authorized
      flash[:alert] = "Désolé, vous n'êtes pas autorisé à faire cette action"
      redirect_to(root_path)
    end

    def trip_params
      params.require(:trip).permit(:name, :description, :category, :price_per_hour, :city, :policy, :picture)
    end
  end
end
