require 'nokogiri'
require 'open-uri'
require 'pry'
#require_relative  'addresses.rb'
#require_relative 'collection_day.rb'

module CompostCli 
  class Boroughs 
  attr_accessor :name, :addresses, :url 
  
  def self.list_borough_names
    self.scrape_boroughs
  end 
  
  def self.scrape_boroughs
    borough_list = []
    doc = Nokogiri::HTML(open("https://www.grownyc.org/compost/locations"))
    binding.pry
    boroughs = doc.search(#strip boroughs from website)
    boroughs.each_with_index{|borough, index|
    if index < 5 then
      
      
    
    
  end 
    #should return a numbered array of bunch of instanes of boroughs 
  
  
  
end 