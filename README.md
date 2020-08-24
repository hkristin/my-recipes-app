MyRecipesApp

Welcome to my Ruby on Rails App!

My recipe app allows a user to create accounts where they can keep track of cookbooks, which contain many recipes.

Installation

1.) Fork/ clone this repo --> Save somewhere on your machine --> cd into the repo

2.) Run bundle install for gem setup

3.) Run rails db:migrate to setup database and tables

4.) Run rails s and head over to the browser to view the site

Usage

At the root page, the User may choose to either sign in with an existing account or sign up for a new one. Whether they login or signup, the User has the option of doing so with third-party authentication (through Facebook).

IMPORTANT NOTE : If you choose to sign up/ login through an existing account, please stick with whatever account
you choose from that point on. If you sign out and try to login again through a different existing account, you
will be redirected to the signup page, from where you can just click the appropriate login link to log in
normally.

The User is then taken to their /cookbooks page where they'll see a list of their cookbooks. They can click on any one to see more information. Within an individual cookbook page (/cookbooks/:id) the User will see cookbook info along with a list of its recipes.

A User can click on any recipe within a cookbook to see more information about the recipe (/cookbooks/:id/recipes/:id). They'll find things like the recipe's ingredients, difficulty, along with cook time and prep time involved.

Along with creating and viewing cookbooks and recipes, the User can also edit them. A User can also choose to either simply remove an recipe from a cookbook (soft-destructive) or delete the recipe entirely (hard-destructive).

Contributing
Any and all suggestions are welcome! Please feel free to submit a pull-request or report a problem in the "Issues" tab.

License
The gem is available as open source under the terms of the MIT License.

Code of Conduct
Everyone interacting in the MyRecipeApp project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.
