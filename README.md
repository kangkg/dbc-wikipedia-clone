# dbc-wikipedia-clone

http://dbc-wikipedia-clone.herokuapp.com/


### Description
dbc-wikipedia-clone is a *revolutionary* way of posting, editing, and browsing articles. In addition, users can search by keyword for a specific article.
Users can create and edit other articles. A revision history for each article can track their changes.


### Our Contributors

* Kenneth Kang (kangkg)
* Vince Roti (vinceroti)
* Matthew Ramuta (mramuta)
* Eraince Wang (eraince)


### How to install and run this project locally:

This project uses ruby 2.2.2p95, and Rails 5.0.0.1

In your terminal:

1. `git clone https://github.com/kangkg/dbc-wikipedia-clone.git`
2. `cd dbc-wikipedia-clone`
3. `bundle install`
4. `rails db:create`
5. `rails db:migrate`
6. `rails db:seed`
7. `rails server`
8. Outside of your terminal, navigate to `http://localhost:3000/` and you should see our site!


### Current Functionality:

You can register on this site, allowing you to create revisions and new pages. Pages that are not 'published' will not be publicly viewable, unless you are the author. Much of the website's functionality is somewhat hidden, as there are different user privilege-levels, such as 'admin' and 'superadmin.' You can login with the credentials: 'pie' and 'pie' to try out the additional 'superadmin' settings, such as being able to promote other users to 'admin', publish pages, or delete pages completely. 
