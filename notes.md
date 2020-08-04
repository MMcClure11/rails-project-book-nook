# Nested Routes
- [x] make sure you understand how they are working
- [x] clean up controller
- [x] verify protecting routes, user resource and redirect/show error pages appropriately

## Lists
- [x] adding a book to a list removes it from another user's list
- [X] solved the above, but now they are making duplicates of the book in a user's list
- [X] semi fix, only add books on list new and edit by using collection_select
- [] refactor to scope or class method or helper method?
- [x] protect lists from book show page

## Helpers
- [] add helper to display errors from validations OR use flash??

## CSS
- [] make it peerrrrty

# Pagination
- [x] pagination gem
- [] not quite working with search returning an empty array

# API
- [X] incorporate it so users don't have to manually create books?
- [] remove option to manually create a book? manually made books do not appear in search
  - [] alternatively, have search work for all books in database and move current search to create a book??
- [x] "fledg" returns an error because of .join on author nil class...fix? removed .join from create method, moved to books helper and gsub authors

# Book Model
- [] separate auther and genre into their own models
[x] books can only be edited or deleted if there are no reviews or lists associated with it

# Reviews
- [x] display average rating, use stars?
- [x] user can only have one review per book

# Notes
- [] note belongs to a book and a user
- [] book has_many notes, has_many users through notes
- [] user has_many notes, has_many books through notes

## Auth
- [x] change to github, used nickname as unique identifier
- eliminate email attribute for user

# Specifications for the Rails Assessment
Specs:

 - [X] Using Ruby on Rails for the project: made with 'rails new'
 - [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes): User has_many lists
 - [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) List belongs_to User
 - [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients): User has_many lists through book_lists, Book has_many lists through book_lists
 - [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) Book has many Users through Reviews 
 - [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity): attribute_name: review has a rating and content that users submit
 - [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) validations for presence and uniqueness of username in User, presence of title and author in Book, presence of list name and description in List
 - [] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
 - [X] Include signup: user can signup
 - [X] Include login: user can login
 - [X] Include logout: user can logout
 - [X] Include third party signup/login (how e.g. Devise/OmniAuth), includes signup/login with github
 - [X] Include nested resource show or index (URL e.g. users/2/recipes): books/2/reviews
 - [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new): books/2/reviews/new
 - [X] Include form display of validation errors (form URL e.g. /recipes/new): included for signup up, making books, lists, and reviews
Confirm:

 - [] The application is pretty DRY
 - [] Limited logic in controllers
 - [] Views use helper methods if appropriate
 - [X] Views use partials if appropriate