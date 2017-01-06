class Store
  attr_reader :name, :city, :distance, :type, :phone

  def initialize(attributes)
    @name     = attributes[:name]
    @city     = attributes[:city]
    @distance = attributes[:distance]
    @type     = attributes[:storeType]
    @phone    = attributes[:phone]
  end

  def self.generate_stores(zip)
    response = BestbuyService.new.stores_by_distance(zip)
    response[:stores].map do |store|
      Store.new(store)
    end
  end

  def self.total_stores(zip)
    response = BestbuyService.new.stores_by_distance(zip)
    response[:total]
  end

end
