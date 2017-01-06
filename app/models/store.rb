class Store
  attr_reader :name, :city, :distance, :type, :phone

  def initialize(attributes)
    @name     = attributes[:name]
    @city     = attributes[:city]
    @distance = attributes[:distance]
    @type     = attributes[:storeType]
    @phone    = attributes[:phone]
  end
end
