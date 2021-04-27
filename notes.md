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