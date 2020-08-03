BASE_URL = "https://www.googleapis.com/books/v1/volumes?q="
API_PARTIAL_URL = "&key=#{ENV['API_KEY']}"

class GoogleApi

  attr_reader :results

  def self.search(query)
    @results = HTTParty.get(BASE_URL + "#{query}" + "&maxResults=10" + API_PARTIAL_URL)
  end
end