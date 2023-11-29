class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log
              

  def initialize(info)
    @name = info[:name]
    @min_height = info[:min_height]
    @admission_fee = info[:admission_fee]
    @excitement = info[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new
  end

  def board_rider(visitor)
    if visitor.tall_enough?(min_height) && visitor.preference_check(@excitement)
      if @rider_log[visitor] == nil
      @rider_log[visitor] = 1
      else visitor.name == visitor.name
      @rider_log[visitor] += 1
      end
      @total_revenue += @admission_fee
      visitor.spend(@admission_fee)
    else
      false
    end
  end

  # def board_rider(visitor)
  #   if visitor.name == visitor.name
  #     @rider_log[visitor] += 1
  #   else
  #     @rider_log[visitor] = 1
  #   end
  #     @rider_log
  # end
 #says that everything is passing even the unfinsihed method... sus


 
end
