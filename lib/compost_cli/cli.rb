#our CLI Controller, welcoming the user and dealing with user input

class CompostCli::CLI
  
  def start 
    list_boroughs 
    select_boroughs
    list_addresses
    select_address
    collection_day
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
    puts "Welcome! Composting is an easy way to reduce waste. However, urban composting can be hard, we're here to help simplify it for New Yorkers!" 
    puts "There are compost drop-off locations in all five boroughs:"
    
    borough_arr = CompostCli::Boroughs.list_borough_names
    puts  borough_arr.map.with_index{|borough, index|
      "#{index+1}. #{borough.name}"
    }
    select_borough(borough_arr)
  end 
  
  def select_borough(borough_arr)
    input = nil 
    while true #input != "exit"
    puts "Please select a borough 1 - 5 from which you would like to find a compost drop-off location or type exit to exit:"
    input = Readline.readline("Select borough ",  true).strip #gets.strip.downcase
    
    go_compost if input.downcase === "exit"
    input = input.to_i
    
    if input > 0 && input < 5  
      the_borough = borough_arr[input-1].name.strip
      puts "Here is list of compost drop-off locations for #{the_borough.upcase}:"
      list_addresses(the_borough)
    else 
      puts "Invalid Input. Please enter the number of the borough in which you would like to find a compost drop-off location or type exit to exit:"
    end 
   end
  end 
  
  def list_addresses(the_borough) 
    #@addresses = [] (?)
    puts "Please select the number that corresponds with the compost drop-off address you would like more information on or type list to return to the list of boroughs or type exit to exit:"
    addresses_arr = CompostCli::Addresses.list_addresses(the_borough)
    
    puts addresses_arr.map.with_index{|address, index|
      "#{index+1}. #{address.name},  #{address.location}"
    }
    select_address(addresses_arr)
  end 
  
  def select_address(addresses_arr)
    input = nil 
    while input true #!= "exit"  
      input = Readline.readline("Select address: ", true).strip
      
      go_compost if input.downcase === "exit"
      list_boroughs if input.downcase === "list"
      
      address_choice =  input.to_i
      
      if address_choice > 0  
        chosen_address = addresses_arr[address_choice-1].name.upcase
        
        puts "Here are the days and hours of operation for #{chosen_address}"
        collection_day(chosen_address)
      else 
        puts "Invalid Input. Please select the number that corresponds with the compost drop-off address you would like more information on or type list to return to the list of boroughs or type exit to exit:"
      end 
    end 
  end 
  
  def collection_day(chosen_address)
    collection_days = CompostCli::Collection_day.new(chosen_address)
    puts collection_days.address_info
  end 
  
  def go_compost
    puts "Now get out there and start composting New York!"
    exit
  end 
 end
end 

puts CompostCli::CLI.new.start