class CompostCli::Boroughs 
  attr_accessor :name, :addresses, :url 
  
  def self.all 
    #should return a numbered array of bunch of instanes of boroughs 
    #scrape data off of https://www.grownyc.org/compost/locations and then return the list of boroughs 
  end
  
  def self.scrape_boroughs 
    boroughs = []
    #go to grownyc site, find the boroughs 
    #extract the properties 
    #instantiate a borough
    #want to end up with an array of boroughs that I scraped 
    boroughs << self.scrape_grownyc
    
    boroughs 
  end 
  
  def self.scrape_grownyc
    doc = Nokogiri::HMTL(open("https://www.grownyc.org/compost/locations"))
    binding.pry
  end 
  
  
end 