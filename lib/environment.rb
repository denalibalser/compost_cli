require 'open-uri'
require 'nokogiri'
require 'pry'

require "compost_cli/version"
require "compost_cli/addresses"
require "compost_cli/boroughs"
require "compost_cli/cli"
require "compost_cli/collection_days"
require "compost_cli/scraper"

module CompostCli
  class Error < StandardError; end
  # Your code goes here...
end
