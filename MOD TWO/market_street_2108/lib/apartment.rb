class Apartment
    attr_reader :renter,
                :unit

    def initialize(unit)
        @unit = unit
        @renter
    end

    def number
        @unit[:number]
    end

    def monthly_rent
        @unit[:monthly_rent]
    end

    def bathrooms
        @unit[:bathrooms]
    end

    def bedrooms
        @unit[:bedrooms]
    end
    
    def renter
        @unit[:renter]
    end

    def add_renter(new_renter)
        @unit[:renter] = new_renter
    end
end