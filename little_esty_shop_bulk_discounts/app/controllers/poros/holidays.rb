class Holiday 
  attr_reader :name, :date
  def initialize(data)
    @name = data[:name]
    @date = data[:date]
  end


  response = HTTParty.get('https://date.nager.at/api/v3/PublicHolidays/2023/US')

  parsed = JSON.parse(response.body, symbolize_names: true)

  @holidays = parsed.map do |data|
    Holiday.new(data)
   
  end
  
  @holidays.each do |holiday|
    puts "Holiday: #{holiday.name}"
    puts "Holiday's Date: #{holiday.date}"
  end
end