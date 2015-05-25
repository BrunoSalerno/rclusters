module RClusters
  class PixelDistance < Base
    OFFSET = 268435456
    RADIUS = 85445659.4471
    ZOOM = 12

    def initialize(opts = {})
      super
      @offset = opts[:offset] || OFFSET
      @radius = opts[:radius] || RADIUS
      @zoom = opts[:zoom] || ZOOM
    end

    private

    def distance(lat1,lon1,lat2,lon2,opts={})
      zoom = opts[:zoom] || @zoom

      x1 = lon_to_x(lon1)
      y1 = lat_to_y(lat1)
      x2 = lon_to_x(lon2)
      y2 = lat_to_y(lat2)

      Math.sqrt((x1-x2)**2 + (y1-y2)**2).to_i >> (21 - zoom)
    end

    def lon_to_x(lon)
      (@offset + @radius * lon * Math::PI / 180).to_i
    end

    def lat_to_y(lat)
      (@offset + @radius *
          Math.log((1 + Math.sin(lat * Math::PI / 180)) /
                       (1 - Math.sin(lat * Math::PI / 180))) / 2)
    end
  end
end