class Vehicle

	attr_accessor :make, :name

  def initialize(params={})
    @make = params[:make]
	  @name = params[:model]
  end
end
