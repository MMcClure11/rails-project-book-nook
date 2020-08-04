x Nested Routes
x make sure you understand how they are working
x clean up controller
x verify protecting routes, user resource and redirect/show error pages appropriately

# Lists
x adding a book to a list removes it from another user's list
X solved the above, but now they are making duplicates of the book in a user's list
X semi fix, only add books on list new and edit by using collection_select
- refactor to scope or class method or helper method?
x protect lists from book show page

# Helpers
- add helper to display errors from validations OR use flash??

# CSS
- make it peerrrrty

# Pagination
x pagination gem
- not quite working with search returning an empty array

# API
X incorporate it so users don't have to manually create books?
- remove option to manually create a book? manually made books do not appear in search
  - alternatively, have search work for all books in database and move current search to create a book??
x "fledg" returns an error because of .join on author nil class...fix? removed .join from create method, moved to books helper and gsub authors

# Book Model
- separate auther and genre into their own models
x books can only be edited or deleted if there are no reviews or lists associated with it

# Reviews
x display average rating, use stars?
x user can only have one review per book

# Notes
- note belongs to a book and a user
- book has_many notes, has_many users through notes
- user has_many notes, has_many books through notes

# Auth
x change to github, used nickname as unique identifier
- eliminate email attribute for user