require 'openssl'
require 'geokit'

module RClusters
  class SurfaceDistance < Base
    def distance(lat1,lon1,lat2,lon2,opts={})
      Geokit::default_units = opts[:default_units] || :meters
      Geokit::default_formula = opts[:default_formula] || :sphere

      Geokit::LatLng.new(lat1,lon1).distance_to(Geokit::LatLng.new(lat2,lon2))
    end
  end
end