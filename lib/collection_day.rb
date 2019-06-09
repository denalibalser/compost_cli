class CompostCli::Collection_day
  
  #has many addresses
  #has many boroughs through addresses
  
  attr_accessor :addresses, :collection_day
  
  
end 