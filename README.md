# README

## Book Nook Review Site

## Overview

- [About The Project](#about)
- [Getting Started](#starting)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## <a id="about">About the Project</a>

The application provides a platform on which users can write book reviews and browse reviews written by other users. A user can only edit and delete a review if it was written by themselves. The app pulls book information from the Google Books API and users can choose to add books to the Book Nook collection by searching books by title sending the query to Google Books. It also gives them the option to manually create a book on the offhand chance that the book is not found by the API. Users can also search the Book Nook Collection by book title directly without having to go through the API. This search funtion is faster and provides a means to search the collection for books that were manually added by users.

Users can also create lists to which they can add books from the Book Nook database so they can have collections of books that they like or that they want to read. Users can only edit and delete their own lists and reviews. Books can only be edited or deleted from the database if they are not associated with a review or a list.

## <a id="starting">Getting Started</a>

To get the application started run rails s in your terminal and then go to your browser and open "http://localhost:3000".

## <a id="prerequisites">Prerequisites</a>

This is an example of what you you need to use the software and how to install them.
<br>
bundle install<br>
rails console<br>
rails db:migrate<br>

## <a id="installation">Installation</a>

1. Clone the repo
  <br>git clone git@github.com:MMcClure11/rails-project-book-nook.git
2. Install the gemfile packages
  <br>bundle install
3. You will need to navigate to to Google's page about using API keys to use teh API portion of the application: "https://cloud.google.com/docs/authentication/api-keys?visit_id=637326662655196360-49195939&rd=1"
  <br>Scroll down to the section "Creating and API Key" and follow Google's instructions.
4. Create a env.rb file and enter your ENV variables:
  <br>API_KEY="YOUR_OWN_KEY_HERE"

## <a id="contributing">Contributing</a>

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the Project
2. Create your Feature Branch (git checkout -b feature/AmazingFeature)
3. Commit your Changes (git commit -m 'Add some AmazingFeature')
4. Push to the Branch (git push origin feature/AmazingFeature)
5. Open a Pull Request

Bug reports and pull requests are welcome on GitHub at https://github.com/MMcClure11/rails-project-book-nook.git.

## <a id="license">License</a>

Distributed under the MIT License. https://opensource.org/licenses/MIT

## <a id="acknowledgements">Acknowledgements</a>
- Flatiron School
- @Jordles113
