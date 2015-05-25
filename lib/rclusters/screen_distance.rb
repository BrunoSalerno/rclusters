require 'pixeldistance'

module RClusters
  class ScreenDistance < Base
    ZOOM = 12

    def initialize(opts = {})
      super
      @zoom = opts[:zoom] || ZOOM
    end

    private

    def distance(lat1,lon1,lat2,lon2,opts={})
      zoom = opts[:zoom] || @zoom
      PixelDistance::from_coords(lat1,lon1,lat2,lon2,zoom)
    end
  end
end