class Attendee
  attr_reader :name,
              :budget

  def initialize(info)
    @name = info[:name]
    @budget = info[:budget].delete('$').to_i
  end

  def attendee_name
    @attendee.map do |name|
      attendee.name
    end
  end
end
