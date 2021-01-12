require_relative "./fresh_astrologer/version"
require_relative "./fresh_astrologer/cli"
require_relative "./fresh_astrologer/movie"
require_relative "./fresh_astrologer/actor"
require_relative "./fresh_astrologer/scraper"

require 'open-uri'
require 'watir'
require 'nokogiri'
require 'pry'
require 'curb'
require 'date'

module FreshAstrologer
  class Error < StandardError; end
  # Your code goes here...
end
