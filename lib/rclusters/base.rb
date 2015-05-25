module RClusters
  class Base
    def initialize(opts = {})
      @points = opts[:points]
      @max_distance = opts[:max_distance]
    end

    def calculate(points = nil,max_distance = nil, opts={})
      points ||= @points
      max_distance ||= @max_distance
      cluster(points,max_distance,opts)
    end

    private

    def distance(lat1,lon1,lat2,lon2,opts={})
      # To be implemented by specific classes
    end

    def cluster(points, max_distance,opts)
      return unless points and max_distance

      clusters = []
      points = points.clone
      points.count.times do
        point = points.pop

        next if point.nil?

        cluster = []
        points.each_with_index {|target, index|
          next if target.nil? or point.nil?

          distance = distance(point[:lat], point[:lon], target[:lat], target[:lon],opts)

          if max_distance > distance
            cluster.push(target)
            points[index]= nil
          end
        }

        cluster.push(point)
        clusters.push(cluster)
      end

      clusters.map {|cl|
        {:size =>cl.count, :cluster=>cl}
      }
    end
  end
end