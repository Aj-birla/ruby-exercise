class BirdCount
  attr_accessor :birds_visited
  def self.last_week
    obj = BirdCount.new([0, 2, 5, 3, 7, 8, 4])
    obj.birds_visited[0,7]
  end

  def initialize(birds_per_day)
    # debug birds_per_day
    @birds_visited = birds_per_day
  end

  def yesterday
    birds_visited[-2]
  end

  def total
    birds_visited.sum
  end

  def busy_days
    birds_visited.count{|v| v >= 5 }
  end

  def day_without_birds?
    birds_visited.any? {|n| n==0}
  end
end
