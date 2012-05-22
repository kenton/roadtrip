require 'rubyXL'

module RoadTrip
  class XLSParser

    attr_accessor :data, :vehicles

    def initialize(file)
      @data = RubyXL::Parser.parse(file)
      @vehicles = vehiclize(@data)
    end

    Vehicle = Struct.new(:year, :make, :carline, :mpg_city, :mpg_hwy)
    def vehiclize(data)
      vehicle_list = data.worksheets[0].extract_data.collect { |cell| Vehicle.new(cell[0].to_s, cell[2], cell[3], cell[9], cell[10] ) }
      vehicle_list.slice!(0)
      vehicle_list
    end

    def to_hash
      output = {}

      @vehicles.each do |v|
        output[v.year] = {} unless output.has_key?(v.year)
        output[v.year][v.make] = {} unless output[v.year].has_key?(v.make)

        output[v.year][v.make].merge!({v.carline => { :city => v.mpg_city, :highway => v.mpg_hwy }})
      end

      output
    end

  end
end
