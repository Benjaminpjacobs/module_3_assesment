class BestBuyService
  def initialize(args)
    @zip = args[:zip] if args[:zip]
    @radius = args[:radius] if args[:radius]
    @conn = Faraday.new(:url => "https://api.bestbuy.com")
  end

  def self.within_radius(args)
    new(args).find_by_radius
  end

  def find_by_radius
    response = @conn.get path, {format: "json", 
                                show: "longName,city,distance,phone,storeType", 
                                pageSize: 20, 
                                apiKey: "#{ENV['best_buy_api_key']}"}
    JSON.parse(response.body, symbolize_names: true)
  end

  def path
    URI.encode("/v1/stores(area(#{zip}, #{radius}))")
  end

  private
   attr_reader :zip, :radius
end