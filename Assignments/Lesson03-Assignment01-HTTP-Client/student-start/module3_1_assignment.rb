require 'httparty'
require 'dotenv'
Dotenv.load

class Recipe
    include HTTParty

    base_uri 'http://food2fork.com/api'
    default_params key: ENV["FOOD2FORK_KEY"]
    format :json

    def self.for term
        get("", query: { query: term })["elements"]
    end
end
