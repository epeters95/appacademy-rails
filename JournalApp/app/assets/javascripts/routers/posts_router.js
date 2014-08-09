JournalApp.Routers.PostsRouter = Backbone.Router.extend({ 
  routes: {
    "": "postsIndex",
    "posts/new": "postNew",
    "posts/:id": "postShow"
  },
  
  postsIndex: function() {
    var view = new JournalApp.Views.PostsIndex({
      collection: JournalApp.posts
    });
    JournalApp.posts.fetch()
    $('#sidebar').html(view.render().$el);
  },
  
  postShow: function(id) {
    debugger;
    var post = JournalApp.posts.getOrFetch(id);
    var show = new JournalApp.Views.PostShow({
      model: post
    });
    var form = new JournalApp.Views.PostForm({
      model: post
    });
    $('#content').html(show.render().$el);
  },
  
  postNew: function() {
    var post = new JournalApp.Models.Post();
    var form = new JournalApp.Views.PostForm({
      model: post,
      collection: JournalApp.posts
    });
    $('#content').html(form.render().$el);
  }
})