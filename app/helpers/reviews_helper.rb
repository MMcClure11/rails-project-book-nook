module ReviewsHelper

  def stars(num)
    if num
      "⭐️" * num
    else
      "No reviews have been written."
    end
  end

  def display_created_at(date_time)
    date_time.strftime("%e %b %Y - %l:%M%p")
  end

end