NewReader.Collections.Entries = Backbone.Collection.extend({
  url: function () {
    return this.feed.url() + '/entries';
  }
})