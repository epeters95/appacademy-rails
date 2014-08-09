NewReader.Views.FeedsIndex = Backbone.View.extend({
  template: JST["feeds_index"],
  
  initialize: function () {
    this.listenTo(this.collection, "sync remove add", this.render)
  },
  
  events: {
    "click button.delete" : "deleteFeed"
  },
  
  render: function() {
    this.$el.html(this.template({
      feeds: this.collection
    }));
    var model = new NewReader.Models.Feed
    var feedForm = new NewReader.Views.newFeed();
    this.$("#form").append(feedForm.render().$el)
    return this;
  },
  
  deleteFeed: function(event) {
    event.preventDefault();
    var id = $(event.currentTarget).data("id");
    var feed = this.collection.getOrFetch(id);
    feed.destroy();
  }
})