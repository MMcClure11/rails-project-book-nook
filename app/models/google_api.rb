BASE_URL = "https://www.googleapis.com/books/v1/volumes?q="
API_PARTIAL_URL = "&key=#{ENV['API_KEY']}"

class GoogleApi

  attr_reader :results

  def self.search(search)
    @results = HTTParty.get(BASE_URL + "#{search}" + "&maxResults=1" + API_PARTIAL_URL)
    @results["items"].first["volumeInfo"]
  end
end