JournalApp.Collections.Posts = Backbone.Collection.extend({
  url: "/posts",
  model: JournalApp.Models.Post,
  getOrFetch: function(id) {
    var post;
    if (post = this.get(id)) {
      return post;
    } else {
      post = new JournalApp.Models.Post({id: id});
      post.fetch();
    }
    return post;
  }
});