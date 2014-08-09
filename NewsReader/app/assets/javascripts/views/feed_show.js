NewReader.Views.FeedShow = Backbone.View.extend({
  template: JST["feed_show"],
  
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },
  
  events: {
    "click button#refresh-button" : "refresh"
  },
    
  render: function() {
    this.$el.html(this.template({
      feed: this.model,
      entries: this.model.entries()
    }));
    this.model.entries().each(function(entry) {
      var view = new NewReader.Views.EntryShow({ model: entry });
      this.$("ul.entries").append(view.render().$el);
    })
    return this;
  },
  
  refresh: function() {
    this.model.fetch();
  }
})