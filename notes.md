# Nested Routes
- [x] make sure you understand how they are working
- [x] clean up controller
- [x] verify protecting routes, user resource and redirect/show error pages appropriately

## Lists
- [x] adding a book to a list removes it from another user's list
- [X] solved the above, but now they are making duplicates of the book in a user's list
- [X] semi fix, only add books on list new and edit by using collection_select
- [X] refactor to scope or class method or helper method?
- [x] protect lists from book show page

# Partials
- [X] add partial to display errors from validations 

## CSS
- [] make it peerrrrty
    - [ ] create a book
    - [ ] edit a book
    - [ ] your lists
    - [X] lists show
    - [ ] create list
    - [ ] edit lists
    - [ ] most reviews

# Pagination
- [x] pagination gem
- [] not quite working with search returning an empty array

# API
- [X] incorporate it so users don't have to manually create books?
- [X] remove option to manually create a book? manually made books do not appear in search, decided to keep so allow user to make own book if not found by googlebooks
  - [X] alternatively, have search work for all books in database and move current search to create a book??, have two different searches in index, one for BookNook collection and the other for GoogleBooks
- [x] "fledg" returns an error because of .join on author nil class...fix? removed .join from create method, moved to books helper and gsub authors
- [ ] ask Nicky, sometimes when i search a book it doesn't always find it...why would that be? example "The Name of the Wind", well it finds it, but then it rollsback the transaction

# Book Model
- [ ] add genre as a model
- [x] books can only be edited or deleted if there are no reviews or lists associated with it
- [ ] index after search add delete button 
- [ ] add additional attributes that I can easily get from API (image)

# Reviews
- [x] display average rating, use stars?
- [x] user can only have one review per book

# Notes
- [ ] note belongs to a book and a user
- [ ] book has_many notes, has_many users through notes
- [ ] user has_many notes, has_many books through notes

## Auth
- [x] change to github, used nickname as unique identifier

# Favorites Model
- [ ] joins table

