class Availability
  def initialize(db)
    @db = db
    @reservations = []
  end

  def available_between?(checkin, checkout)
    ((checkin...checkout).to_a & reservations).empty?
  end
  
  private
  def reservations
    @reservations |= @db[:availabilities].flat_map do |availability|
      year = availability[:year]
      month = availability[:month]
      days = availability[:days]
      days.split("").each_index.select{|i| days[i] == '1'}.map{|index| Date.new(year, month, index+1)}
    end
  end
end