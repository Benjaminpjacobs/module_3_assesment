class Store
  attr_reader :name, :city, :distance, :phone, :type
  
  def initialize(store)
    @name = store[:longName]
    @city = store[:city]
    @distance = store[:distance]
    @phone = store[:phone]
    @type = store[:storeType]
  end

  def self.within_zip(args)
    BestBuyService.within_radius({zip: args["search"], radius: args["radius"]})[:stores].map do |store|
      new(store)
    end
  end
end