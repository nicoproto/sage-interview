require 'open-uri'

class ChuckFactsService < ApplicationService
  BASE_URL = 'https://api.chucknorris.io/jokes/'

  attr_reader :query

  def initialize(type, query = '')
    @type = type
    @query = query
  end

  def call
    return false if @query.length < 3 && @type != 'random'

    case @type
    when 'random'
      url = BASE_URL + 'random'
    when 'category'
      url = BASE_URL + 'random?category=' + @query
    when 'words'
      url = BASE_URL + 'search?query=' + @query
    end

    data_serialized = URI.open(url).read
    data = JSON.parse(data_serialized)

    @type == 'words' ? data["result"].map {|x| x['value']} : [data["value"]]
  end
end

