JournalApp.Views.PostsIndex = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, 
                  "add change remove reset",
                  this.render);
  },
  
  template: JST["posts_index"],
  
  events: {
    "click button.delete": "deletePost"
  },
  
  deletePost: function(event) {
    var postId = $(event.currentTarget).data("id");
    console.log(postId);
    var post = this.collection.get(postId);
    post.destroy();
  },
  
  render: function() {
    var content = this.template({
      posts: this.collection
    });
    this.collection.fetch();
    this.$el.html(content);
    return this;
  }

});