JournalApp.Views.PostForm = Backbone.View.extend({
  //url: "#/posts",
  template: JST["post_form"],
  events: {
    "submit form": "submit"
  },
  
  submit: function(event) {
    event.preventDefault();
    var currentPost = this.model;
    var postAttributes = {
        title: $("#post-title").val(),
        body: $("#post-body").val()
      };
    if (currentPost.isNew()) {
      this.collection.create(postAttributes, {
        success: function() {
          currentPost.fetch();
        } 
      });
    } else {
      currentPost.save(postAttributes, {
        success: function() {
          currentPost.fetch();
        }
      });
    }
  },
  
  render: function() {
    var content = this.template({
      post: this.model
    });
    this.$el.append(content);
    return this;
  }
});