#requirements

class CompostCli::Addresses
   
  attr_accessor :hours, :days_of_week, :boroughs, :addresses, :collection_days, :location,  :name 
  
  def initialize(name)
    @name = name 
  end 
  
  def address_info
    scrape_collection_info
    
    puts "#{@days_of_week}
          #{@hours}"
  end 
  
  def scrape_collection_info
    doc = Nokogiri::HTML(open(url))
    
  end 
  
  
end 