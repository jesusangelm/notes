class MapController < ApplicationController
  def index
    @profiles = Profile.all

    @hash = Gmaps4rails.build_markers(@profiles) do |profile, marker|
      marker.lat profile.latitude
      marker.lng profile.longitude
      marker.title profile.location
    end
  end
end
