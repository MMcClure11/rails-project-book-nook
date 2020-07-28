BASE_URL = "https://www.googleapis.com/books/v1/volumes?q="
API_PARTIAL_URL = "&key=#{ENV['API_KEY']}"

class GoogleApi

  attr_reader :results

  def self.search(search)
    byebug
    @results = HTTParty.get(BASE_URL + "#{search}" + API_PARTIAL_URL)
    @results
  end
  results["items"].first["volumeInfo"]["title"]
end