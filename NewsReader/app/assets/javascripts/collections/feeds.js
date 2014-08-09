NewReader.Collections.Feeds = Backbone.Collection.extend({
  url: "api/feeds",
  model: NewReader.Models.Feed,
  
  getOrFetch: function(id) {
    var instance = this.get(id)
    if (!instance) {
      instance = new NewReader.Models.Feed({ id: id });
      var that = this;
      instance.fetch( {
        success: function () { that.add(instance); }
      })
    } else {
      instance.fetch();
    }
    return instance;
  }
})