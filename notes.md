x Nested Routes
x make sure you understand how they are working
x clean up controller
x verify protecting routes, user resource and redirect/show error pages appropriately

# Helpers
- add helper to display errors from validations OR use flash??

# CSS
- make it peerrrrty

# API
- incorporate it so users don't have to manually create books?
- eliminate edit and delete functionality in that case

# OR

# Book Model
- separate auther and genre into their own models
- user can edit or delete a book if it has no review or no lists

# Reviews
- display average rating, use stars?
- user can only have one review per book

# Notes
- note belongs to a book and a user
- book has_many notes, has_many users through notes
- user has_many notes, has_many books through notes

# Auth
- change so that email is unique, and sign up with name, display name on review