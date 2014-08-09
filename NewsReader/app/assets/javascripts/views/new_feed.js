NewReader.Views.newFeed = Backbone.View.extend({
  template: JST["new_feed"],
  
  render: function () {
    this.$el.html(this.template());
    return this;
  },
  
  events: {
    "submit form" : "createFeed"
  },
  
  createFeed: function () {
    var model = new NewReader.Models.Feed({
      title: $("input#title").val(),
      url: $("input#url").val()
    });
    NewReader.feeds.create(model);
  }
  
})