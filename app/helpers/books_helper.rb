module BooksHelper

  def display_author(author)
    if author.is_a?(Array)
      author.join(", ")
    else
      author
    end
  end

end