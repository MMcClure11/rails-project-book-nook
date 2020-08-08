# Nested Routes
- [x] make sure you understand how they are working
- [x] clean up controller
- [x] verify protecting routes, user resource and redirect/show error pages appropriately

# Lists
- [x] adding a book to a list removes it from another user's list
- [X] solved the above, but now they are making duplicates of the book in a user's list
- [X] semi fix, only add books on list new and edit by using collection_select
- [X] refactor to scope or class method or helper method?
- [x] protect lists from book show page

# Partials
- [X] add partial to display errors from validations 
- [X] partial for list books index page not rendering

# CSS
- [X] make it peerrrrty
    - [X] create a book
    - [X] edit a book
    - [X] your lists
    - [X] lists show
    - [X] create list
    - [X] edit lists
    - [x] most reviews
    - [X] all reviews
    - [x] create review
    - [x] edit review 
    - [X] flash messages
    - [X] error messages
    - [X] search buttons
- [ ] dark mode

# Pagination
- [x] pagination gem
- [ ] not quite working with search returning an empty array

# API
- [X] incorporate it so users don't have to manually create books?
- [X] remove option to manually create a book? manually made books do not appear in search, decided to keep so allow user to make own book if not found by googlebooks
  - [X] alternatively, have search work for all books in database and move current search to create a book??, have two different searches in index, one for BookNook collection and the other for GoogleBooks
- [x] "fledg" returns an error because of .join on author nil class...fix? removed .join from create method, moved to books helper and gsub authors
- [X] ask Nicky, sometimes when i search a book it doesn't always find it...why would that be? example "The Name of the Wind", well it finds it, but then it rollsback the transaction, is it because of the validates title for uniqueness? : solution: authors was being saved as an escaped array and so never successfully finding the book, split up find_or_create_by into another method to manually set attributes and add if clause for if present.
- [X] oh no! without unique validator for title the api makes duplicates!! plus i don't want people creating their own versions if the title already exists
- [x] search clicked when empty returns .map error for nil nil class; added OR statement for search["error"]

# Book Model
- [ ] add genre as a model
- [x] books can only be edited or deleted if there are no reviews or lists associated with it
- [X] index after search add delete button 
- [ ] add additional attributes that I can easily get from API (image)


# Reviews
- [x] display average rating, use stars?
- [x] user can only have one review per book

# Notes
- [ ] note belongs to a book and a user
- [ ] book has_many notes, has_many users through notes
- [ ] user has_many notes, has_many books through notes

# Auth
- [x] change to github, used nickname as unique identifier

# Favorites Model
- [ ] joins table

## Must Fix!
- [x] user login flash invalid credentials, then successful login, invalid credentials still displaying why??
- [X] book.reviews.average(:rating).round refactor this (in highest ranked and book show page) to helper method
- [X] display author method removal
- [X] abstract out add_book_to_list book from bookscontroller to applicationcontroller
- [ ] ask nicky about empty space in card on book show page
- [X] book show page don't show empty select tab for list 
- [ ] intro paragraph on dashboard about how to use the site

## TODO
- [ ] BLOG
- [ ] 30 minute recording
- [ ] youtube demo
- [ ] Readme

<b><a href="http://foo.com/">foo</a></b><img src="http://foo.com/bar.jpg" />

<script>alert('mwuahahahahahahhaha')</script>

<script>alert("hello")</script> 

<img src="x" onerror="alert('hello')" />