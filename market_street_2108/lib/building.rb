class Building
    attr_reader :units
                # :renters

    def initialize
        @units = []
        # @renters = []
    end

    def add_unit(unit)
        @units << unit
    end

    def renters
        unit_renters = []
        @units.each do | unit |
            unit_renters << unit.renter.name
        end
        return unit_renters
    end

    def average_rent
        unit_rent = @units.map do | unit |
            unit.monthly_rent.to_f
        end
        (unit_rent.sum / @units.length).round(1)
    end

    def rented_units
        @units.select do | unit |
            unit.renter != nil
        end
    end

    def renter_with_highest_rent
        highest_unit = rented_units.max_by do | unit |
            unit.monthly_rent
        end
        highest_unit.renter
    end

    def units_by_number_of_bedrooms
        one = []
        two = []
        three = []
        @units.each do | unit |
            if unit.bedrooms == 3
                three << unit.number
            elsif unit.bedrooms == 2
                two << unit.number
            elsif unit.bedrooms == 1
                one << unit.number
            else
                "why are you here"
            end
        end
        {3 => three, 2 => two, 1 => one}
    end

    def annual_breakdown
        breakdown = {}

        rented_units.each do | unit |
            breakdown[unit.renter.name] = (unit.monthly_rent * 12)
        end

        breakdown
    end

    def rooms_by_renter
        rooms = {}

        rented_units.each do | unit |
            rooms[unit.renter] = {bathrooms: unit.bathrooms, bedrooms: unit.bedrooms}
        end

        rooms
    end
end