# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# seed the users table
User.create(username: "Mike", password: "mike", role: "admin")
User.create(username: "Anna", password: "anna", role: "user")
User.create(username: "Jenny", password: "jenny", role: "user")
User.create(username: "Jack", password: "jack", role: "user")
User.create(username: "Lily", password: "lily", role: "user")
# ------------------------------------------------------------
# seed the articles table
Article.create(author_id: "1",title: "Jay Chou", status: "published")
Article.create(author_id: "1",title: "Ruby on Rails", status: "unpublished")
Article.create(author_id: "2",title: "Coffee", status: "published")
Article.create(author_id: "3",title: "Olympic Games",status: "unpublished")
Article.create(author_id: "4",title: "Spotify", status: "unpublished")
Article.create(author_id: "5",title: "Empanada",status: "published")
Article.create(author_id: "5",title: "Shortcake",status: "unpublished")
# -------------------------------------------------------------
# seed the categories table
Category.create(name: "History")
Category.create(name: "Science")
Category.create(name: "Technology")
Category.create(name: "Art")
Category.create(name: "Food")
Category.create(name: "Music")
Category.create(name: "Sports")
# --------------------------------------------------------------
# seed the sorted_articles table
SortedArticle.create(article_id: 1,category_id: 4)
SortedArticle.create(article_id: 1,category_id: 6)
SortedArticle.create(article_id: 2,category_id: 2)
SortedArticle.create(article_id: 2,category_id: 3)
SortedArticle.create(article_id: 3,category_id: 5)
SortedArticle.create(article_id: 4,category_id: 1)
SortedArticle.create(article_id: 4,category_id: 7)
SortedArticle.create(article_id: 5,category_id: 3)
SortedArticle.create(article_id: 5,category_id: 6)
SortedArticle.create(article_id: 6,category_id: 5)
SortedArticle.create(article_id: 7,category_id: 5)
# ---------------------------------------------------------------
# seed the revisions table
Revision.create(editor_id: 1, article_id: 1, body: "Jay Chou (born 18 January 1979) is a Taiwanese musician, singer, songwriter, record producer, actor, and director.")
Revision.create(editor_id: 1, article_id: 1, body: "Jay Chou (born 18 January 1979) is a Taiwanese musician, singer, songwriter, record producer, actor, and director. In 2000, Chou released his debut album, titled Jay (2000), under the record company Alfa Music. Since then his music has gained recognition throughout Asia, most notably in regions such as Taiwan, Mainland China, Hong Kong, Singapore, Malaysia, Indonesia, Korea, Japan and in the Asian communities of Western countries such as the United States and Australia.",previous_revision_id: 1)
Revision.create(editor_id: 1, article_id: 2, body: "Ruby on Rails, or simply Rails, is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages.")
Revision.create(editor_id: 1, article_id: 2, body: "Ruby on Rails, or simply Rails, is a server-side web application framework written in Ruby under the MIT License. Rails is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages.It encourages and facilitates the use of web standards such as JSON or XML for data transfer, and HTML, CSS and JavaScript for display and user interfacing. In addition to MVC, Rails emphasizes the use of other well-known software engineering patterns and paradigms, including convention over configuration (CoC), don't repeat yourself (DRY), and the active record pattern.",previous_revision_id: 3)
Revision.create(editor_id: 2, article_id: 3, body: "This article is about the beverage. For the seed from which it is made, see Coffee bean. For other uses, see Coffee (disambiguation).Coffee is a brewed drink prepared from roasted coffee beans, which are the seeds of berries from the Coffea plant.")
Revision.create(editor_id: 3, article_id: 4, body: "The modern Olympic Games or Olympics (French: Jeux olympiques[1]) are leading international sporting events featuring summer and winter sports competitions in which thousands of athletes from around the world participate in a variety of competitions. The Olympic Games are considered the world's foremost sports competition with more than 200 nations participating.[2] The Olympic Games are held every four years, with the Summer and Winter Games alternating by occurring every four years but two years apart.")
Revision.create(editor_id: 4,article_id: 5,body: "Spotify is a Swedish music, podcast, and video streaming service, launched in October 2008 by startup Spotify AB,[2] that provides digital rights management–protected content from record labels and media companies. It is available in most of Europe, the Americas, Australia, New Zealand, and limited Asian countries and territories.")
Revision.create(editor_id: 5, article_id: 6, body: "An empanada (Spanish pronunciation: [empaˈnaða]) is a stuffed bread or pastry baked or fried in many countries in Spain and Latin America. The name comes from the Spanish verb empanar, meaning to wrap or coat in bread.")
Revision.create(editor_id: 5, article_id: 7, body: "Shortcake is a sweet cake or biscuit (in the American sense: that is, a crumbly bread that has been leavened with baking powder or baking soda).")
# --------------------------------------------------------------
# seed the links table 
Link.create(word: "Jay Chou",article_id: 1)
Link.create(word: "Ruby on Rails",article_id: 2)
Link.create(word: "Coffee",article_id: 3)
Link.create(word: "Olympic Games",article_id: 4)
Link.create(word: "Spotify",article_id: 5)
Link.create(word: "Empanada",article_id: 6)
Link.create(word: "Shortcake",article_id: 7)





