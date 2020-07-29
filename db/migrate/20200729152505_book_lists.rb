class BookLists < ActiveRecord::Migration[6.0]
  def change
    create_table :book_lists do |t|
      t.references :book, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
