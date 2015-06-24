<%= f.collection_select :catalog, @catalogs_group, :id, :name %>
<%= link_to "Literature World", articles_path, id: "logo" %>

<% if is_admin %>
				      <li><%= link_to "Manage User", editors_path %></li>
				    <% end%>


/* Headers */
#logo 
  float: left
  margin-right: 10px
  font-size: 1.7em
  color: #fff
  text-transform: uppercase
  letter-spacing: -1px
  padding-top: 0px
  padding-left: 0px
  font-weight: bold

/* universal */

body 
  padding-top: 60px

section 
  overflow: auto

.center 
  text-align: center

.center h1 
  margin-bottom: 10px