# Skill Distillery Midterm Project

## Puzzle Pieces

### Description

Do you love puzzles? Is your closet overflowing with puzzles you've already completed, but don't feel like taking out and doing again? Do you want to connect with other puzzle lovers just like yourself? Let Puzzle Pieces help! Puzzle Pieces provides a platform for puzzle lovers to exchange or loan puzzles collecting dust in their closet.

### How it Works

To use the Puzzle Pieces app, you must create a user account and log in using that user's credentials. If a user does not log in, a list of available puzzles will display, but no additional information about the puzzles will display. If a user logs in with a valid username/password combination, then the full site functionality is unlocked. Logged in users will be able to select the displayed puzzles on the page to see their details.

Each user has a profile page. On this profile page, the user can view his or her puzzles in inventory, the puzzles he or she has loaned or is loaning, the requests he or she has made or received, and the ratings he or she has received or made. From this page, a user can add, update, or delete puzzles from his or her inventory list, provided that the user is the owner of the inventory item in question. Users can also edit requests and view updated requests on this page.

Users can edit their profiles on the Edit Profile page. From this page, a user can update basic information, such as address, email address, and username. From this page a user can also delete their entire account.

Users can also search for other users and other puzzle items. If the user enters a search term that returns appropriate results (either for an inventory item or a user), a graphical representation of each search result is displayed. Each search result will contain a link to a page that displays more details about that search item - selecting an inventory item result will display more details about that inventory item, while selecting a user item will display that user's user profile.

If a user finds a puzzle he or she wants to borrow or exchange for, the user can make a request for that item. A request message is sent to the owner of the particular inventory item the user requests. In the owner's user profile, a list of submitted requests is displayed. The user can then choose to accept the request or not accept the request, as well as add a message back to the user making the request. If the user accepts a request to borrow the puzzle, a borrow record is created with a valid start and return date, which the requester user can view. If the user accepts a request to own the puzzle, the owner of the item in question is updated to reflect the requester's information, and a borrow record with no return date is created.

### Database Structure

The database contains eleven tables - ten of these tables are reflected in Java Entities and one table is a join table. A User contains an id, username and a password, and it's owned by a User Information table that also owns an Address table - the User Information table contains the user's email address and name, while the Address table contains the user's shipping information.

The User Rating table contains all the ratings for a user, associated using the user's ID. The User Ratings table contains an int rating of 1-5, as well as data tracking who submitted the rating and who the rating is meant for (also associated using the User ID).

A Request table contains all of the requests that are created. When a user creates a request, a line in the database that contains the request information is created, including information about the user who "sent" the request and the user who "received" the request. The receiving user can then choose to handle the request as he or she sees fit, but the same request line in the database continues to be updated (but still viewable by both parties) - in other words, only one request is created when one user makes contact with another user. When a puzzle exchanges hands (or, more accurately, when the owner of an item indicates that he or she intends to loan or give or exchange a puzzle to another user), an entry in the Borrow table is made, with information about a return date, the user who's loaning the item, the user who owns the item, and the item in question.

An Inventory Items table holds all the data about the actual, physical puzzle items. Each inventory item contains data about its user owner as well as the condition of the physical item. A Puzzle table is made to describe the "game essence" of the actual puzzle, like the puzzle's rating, name, and number of puzzle pieces. This allows for the possibility that one person has several copies of the same puzzle - each copy would have a separate Inventory Item entry but the same Puzzle entry. Each Puzzle also has its own Puzzle Rating, as well as one or more Category.

### Lessons Learned

From the outset, I think each member of the team had versions of what they imagined the app would look like, and we were excited to start actually shaping and coding the project. However, in out excitement we didn't put together a great roadmap in terms of how certain functionalities should be implemented and how certain elements should and shouldn't display on the page. Once our fingers outpaced our very basic wireframe, we flailed for a bit trying to figure out the next steps. We had to take part of the weekend to put the brakes on coding and come up with a more detailed plan moving forward. Next time, I think it would be valuable to spend more time upfront coming up with more detailed user stories and goals for the project - this would have saved us some grief down the road.

When we started coding the project, we decided to split the controller up into a User controller, which would handle mappings related to user login and accounts, and a Puzzle controller, which handled essentially everything else. Having the controllers split into two made it easier to work in each controller - someone could do work in the User controller while someone else did work in the Puzzle controller. In hindsight, it may have been better to split out the controllers and DAOs even further - it may have resulted in more files, but it may have made it easier for multiple people to work on more functionalities at once.

At times we as a team had some trouble effectively communicating and working together. We each have different styles of working that we are comfortable with, and I think due to an initial lack of organization we fell into our own work styles that were best for us as individuals but not necessarily best for the group. We eventually did come together, and I think as a group we worked best when we each were willing to compromise a bit and approach a problem in a way in which we would not necessarily approach it as individuals.

### Technologies used

* Canva
* Github
* JPA
* Paletton
* Slack
* Spring MVC
* Spring Tool Suite
