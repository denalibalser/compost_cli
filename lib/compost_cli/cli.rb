#our CLI Controller, welcoming the user and dealing with user input

class CompostCli::CLI
  
  def call 
    puts "Welcome! Composting is an easy way to reduce waste. However, urban composting can be hard, we're here to help simplify it for New Yorkers!" 
    list_boroughs 
    borough_selection
    list_addresses
    address_selection
    list_collection_days
    go_compost
    @boroughs = CompostCli::Boroughs.all
    @boroughs.each_with_index(1) do |borough, i|
      puts "#{i}. #{borough.name}: [@addresses]" #need this to return a list of the addresses associated with the selected borough 
    end 
    @addresses = CompostCli::Addresses.all 
    @addresses.each_with_index(1) do |address, i|
      puts "#{i}. #{address.borough}: #{address.name}"
    end 
  end
  
  def list_boroughs
    #scrape  the boroughs and display as numbered  list ? or just have in the greeting puts 
    puts "There are compost drop-off locations in all five boroughs:"
    puts <<- DOC 
    1. Bronx 
    2. Brookyln 
    3. Manhattan
    4. Queens 
    5. Staten Island 
    DOC 
  end 
  
  def borough_selection
    input = nil 
    while input != "exit"
    puts "Please enter the number of the borough in which you would like to find a compost drop-off location or type exit to exit:"
    input = gets.strip.downcase
    
    if input > 0 
      the_borough = @boroughs[input.to_i(-1)]
      puts "#{i}. #{borough.name}"
    elsif input == "exit"
      go_compost
    else 
      puts "Invalid Input. Please enter the number of the borough in which you would like to find a compost drop-off location or type exit to exit:"
    end 
   end
  end 
  
  def list_addresses 
    #@addresses = [] (?)
    puts "Here is the list of addresses for your borough selection:"
    #scrape list of addresses for the address here and pushes into @addresses array
  end 
  
  def address_selection
    input = nil 
    while input != "exit" #starts loop (while input does not equal "exit" stay in the loop:)
    puts "Please enter the number of the compost drop-off address you would like more information on or type list to see the boroughs again or type exit to exit:"
    input = gets.strip.downcase 
    
    if input.to > 0 #replaced when statements with this if statement 
    the_borough = @boroughs[input.to_i(-1)]
      puts "#{i}. #{borough.name}"
      the_address = @addresses[input.to_i-1]
      puts "#{i}. #{address.name}"
      
    elsif input == "list"
      list_boroughs
    else 
      puts "Invalid Input. Please enter the number of the compost drop-off address you would like more information on or type list to see the boroughs again or type exit to exit:"
      
    end 
   end #ends loop
  end 
  
  def list_collection_days
    #@collection_days =[]
    puts "Here are the collection days and hours of operation for your address selection:"
    #scrapes list of collection days and hours for the selected address and pushes into @collection_days array
  end 
  
  def go_compost
    puts "Now get out there and start composting New York!"
  end 
  
end 