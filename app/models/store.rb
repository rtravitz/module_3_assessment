class Store
  attr_reader :id, :name, :city, :distance, :type, :phone

  def initialize(attributes)
    @id       = attributes[:storeId]
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
