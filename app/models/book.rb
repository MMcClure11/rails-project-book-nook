class Book < ApplicationRecord

  def self.sort_by_title 
    all.order(title: :asc)
  end
end
