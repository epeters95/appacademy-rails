NewReader.Routers.FeedsRouter = Backbone.Router.extend({
  routes: {
    "" : "feedsIndex",
    "feeds/:id" : "feedShow"
  },  
  
  feedsIndex: function() {
    NewReader.feeds.fetch();
    var view  = new NewReader.Views.FeedsIndex({
      collection: NewReader.feeds
    });
    $("#content").html(view.render().$el);
  },
  
  feedShow: function(id) {
    var model = NewReader.feeds.getOrFetch(id);
    var view = new NewReader.Views.FeedShow({
      model: model
    });
    $("#content").html(view.render().$el);
  }
})