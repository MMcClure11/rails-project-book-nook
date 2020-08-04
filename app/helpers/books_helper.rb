module BooksHelper

  def display_author(author)
    author.gsub(/[\"\[\]\\]/, " ")
  end

end