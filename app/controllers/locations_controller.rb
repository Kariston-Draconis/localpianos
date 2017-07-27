class LocationsController < ApplicationController


  def user_location
    # CHANGE LINE BELOW FOR DEPLOYMENT!!
    # result = Geocoder.search(request.remote_ip)
    user_location = Geocoder.search("125.253.50.72")[0]
    render json: {latitude: user_location.latitude, longitude: user_location.longitude}
  end

  def current
    render json: {nearbys: [
      {address: Piano.all[0].address, latitude: Piano.all[0].latitude, longitude: Piano.all[0].longitude, category: Piano.all[0].category},
      {address: Piano.all[1].address, latitude: Piano.all[1].latitude, longitude: Piano.all[1].longitude, category: Piano.all[1].category},
      {address: Piano.all[2].address, latitude: Piano.all[2].latitude, longitude: Piano.all[2].longitude, category: Piano.all[2].category}
      ]
    }
  end




  def search_string
    result_location = Geocoder.search(params[:searchString])[0]
    render json: {
      result: Piano.near(params[:searchString], 20),
      center: {latitude: result_location.latitude, longitude: result_location.longitude}
      # star_ids: {Star.where(user_id: current_user)}
    }.to_json

  end

  def search_coordinates
    render json: {
      result: Piano.near([params[:latitude], params[:longitude]], 20)
    }.to_json
    # render html: params[:latitude] + 'sdf'
  end


end
