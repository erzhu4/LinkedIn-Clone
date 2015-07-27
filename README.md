#LynxIn

##Root Page

The root page contains the basic functions of most sites including creating a new account, guest login, and logging in with twitter. The User authentication is handled by rails in the backend.

The guest log in will create a new user in which two specified existing users will send a connection request to upon log in. The guest user is then destroyed once it is logged out to produce the same guest login experience everytime.

OAuth with twitter is handled by the omniauth-twitter gem. If it is the user's first time logging into the site using a certain twitter account, it will create a new account then pull the user's first and last name from their twitter and fill in the name fields on the new account.

##Toolbar

The main toolbar contains the log out button, search bar, and a pending requests drop down list. The minibar under the main bar contains links to the currently logged in user's home page, profile page, and a list of his/her connections.

The pending requests list is a hidden container which is show upon the hover state in CSS. It takes the backbone model of the current user and lists the pending requests associated with that user.

The home and profile links invoke a backbone router to switch to different views specified in the later sections.

##Homepage
The user's home page contains the user's personal information and an option to edit. Then a panel for "people you may know" to display three other users in which the current user is not connected with. Lastly a search for jobs panel using a google maps api.

The edit personal information panel uses jQuery to append a form for updating info.

The "People You May Know" panel makes a request back to the server for a collection of three users that are not connected with the current user and display their image and information within the panel.

The "search for jobs panel" is an embedded google api that will search by keywords and location.

##Profile page
The profile page shows a user's experiences and education on the main panel and a list of all his/her connections on the right.

When a user views his/her profile, there will be the functionality to edit or remove the experiences and education fields. You can edit the fields simply by clicking on any part of the text.

There is an Add experience and education button unhides a display none element in the html which is a form to add an experience or education field. The form makes an ajax request behind the scenes to the server to create the new fields and store them in the database.
