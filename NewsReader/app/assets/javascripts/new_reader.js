window.NewReader = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    //alert('Hello from Backbone!');
    NewReader.feeds = new NewReader.Collections.Feeds();
    NewReader.router = new NewReader.Routers.FeedsRouter();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  NewReader.initialize();
});
