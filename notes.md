    <!--
    <%= f.label :category, 'Class:'%>
    <%= f.collection_check_boxes :category_ids, :categories, :id, :name %><br>
    <%= f.label :race %>
    <%= f.collection_check_boxes :race_ids, :races, :id, :name %><br>
    -->

    <!--

    4/27
<h4>Add Character to this Campaign:</h4>
<%= form_with(model: [@campaign, @character]) do |f| %>
    <%= f.hidden_field :user_id, value: current_user.id %>
    <%= f.collection_check_boxes :id, @characters, :id, :name %><br>
    <%= f.submit "Add Character" %>
<% end %>
-->
<!-- Somehow need this above form to change Adventure (so that character_id and campaign_id )-->

Specs:

 [X] Using Ruby on Rails for the project
 [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
 [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
 [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
 [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
 [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
 [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
 [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
 [X] Include signup
 [X] Include login
 [X] Include logout
 [X] Include third party signup/login (how e.g. Devise/OmniAuth)
 [X] Include nested resource show or index (URL e.g. users/2/recipes)
 [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
 [X] Include form display of validation errors (form URL e.g. /recipes/new)
Confirm:

 [ ] The application is pretty DRY
 [ ] Limited logic in controllers
 [ ] Views use helper methods if appropriate
 [X] Views use partials if appropriate

TO DO 

[X] Add partials to new and edit for campaign
[X] Add partials to new and edit for character
[X] Add partials to new and edit for weaapon
[ ] FIX RACE AND CLASS TRAITS
[X] Replicate characters-weapons like campaigns-characters
[X] Create partials for new and edit (characters, then campaigns, change all to radio on character)
[ ] Figure out how to create and add new races and classes (Should be similar to characters and campaigns! Maybe with default classes/races and then additional somehow?)






[ ] Be able to share campaigns between users
[ ] Add logic to determine if character is yours in Campaign view
[ ] Dry it up

        <%= f.fields_for :characters do |c| %>
        <%= c.label :name %>
        <%= c.text_field :name %><br>
        <%= c.label :category, "Class:" %>
        <%= c.collection_check_boxes :category_id, @categories, :id, :name %><br>
        <%= c.label :race %>
        <%= c.collection_check_boxes :race_id, @races, :id, :name %><br>
        <% end %>


        5/2

            <%= f.hidden_field :campaign_id, value: @campaign.id%>