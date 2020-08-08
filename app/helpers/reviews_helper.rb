module ReviewsHelper

  def stars(num)
    if num
      "⭐️" * num
    else
      "No reviews have been written."
    end
  end

  def display_created_at(date)
    date.strftime("%e %b %Y")
  end

end