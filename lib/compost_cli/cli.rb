#our CLI Controller, welcoming the user and dealing with user input

class CompostCli::CLI
  
  def call 
    puts "Welcome! Composting is an easy way to reduce waste. However, urban composting can be hard, we're here to help simplify it for New Yorkers!" 
    #(1. Bronx, 2. Brooklyn, 3. Manhattan,  4. Queens, 5. Staten Island):
    list_boroughs 
    borough_selection
    address_selection
    go_compost
    @boroughs = CompostCli::Boroughs.all
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
    puts "Please enter the number of the borough in which you would like to find a compost drop-off location:"
    input = gets.strip
    case input 
    when "1"
      puts "Addresses of compost drop-off locations in the Bronx:" 
      #strip numbered list of Bronx addresses
    when "2"
      puts "Addresses of compost drop-off locations in Brooklyn:" 
      #strip numbered list of Brooklyn addresses
    when "3"
      puts "Addresses of compost drop-off locations in Manhattan:" 
      #strip numbered list of Manhattan addresses
    when  "4" 
      puts "Addresses of compost drop-off locations in Queens:" 
      #strip numbered list of Queens addresses
    when "5"
      puts "Addresses of compost drop-off locations in Staten Island:" 
      #strip numbered list of Staten Island addresses
    end 
  end 
  
  def address_selection
    input = nil 
    while input != "exit" #starts loop (while input does not equal "exit" stay in the loop:)
    puts "Please enter the number of the compost drop-off address you would like more information on or type list to see the boroughs again or type exit to exit:"
    inputs = gets.strip.downcase 
    case input 
     when "1"
      puts "Day(s) of Week Open: , Hours Open: "
    # output the days  of week open and hours associated with the  address of the users input
    
     when "list" #returns to list_boroughs if 'list' is input
      list_boroughs
      
     else #if user inputs something other than number/list/exit
      puts "Invalid Input. Please enter the number of the compost drop-off address you would like more information on or type list to see the boroughs again or type exit to exit:"
    
    end 
   end #ends loop
  end 
  
  def go_compost
    puts "Now get out there and start composting New York!"
  end 
  
end 