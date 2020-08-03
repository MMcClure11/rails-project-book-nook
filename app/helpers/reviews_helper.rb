module ReviewsHelper

  def stars(num)
    if num
      "⭐️" * num
    else
      "No reviews have been written."
    end
  end

end