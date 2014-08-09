window.JournalApp = {
  urlRoot: "/posts",
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {}
};

$(document).ready(function(){
  JournalApp.initialize();
  JournalApp.posts = new JournalApp.Collections.Posts();
  JournalApp.router = new JournalApp.Routers.PostsRouter(); 
  var view = new JournalApp.Views.PostsIndex({
    collection: JournalApp.posts
  });
  JournalApp.posts.fetch()
  $('#sidebar').html(view.render().$el);
  
  Backbone.history.start();
});
