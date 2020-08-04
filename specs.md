# Specifications for the Rails Assessment
Specs:

 - [X] Using Ruby on Rails for the project: made with 'rails new'
 - [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes): User has_many lists
 - [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) List belongs_to User
 - [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients): User has_many lists through book_lists, Book has_many lists through book_lists
 - [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) Book has many Users through Reviews 
 - [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity): attribute_name: review has a rating and content that users submit
 - [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) validations for presence and uniqueness of username in User, presence of title and author in Book, presence of list name and description in List
 - [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes): adds scope, route, and action for most_reviews
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