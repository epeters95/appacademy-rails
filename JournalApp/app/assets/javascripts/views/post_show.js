JournalApp.Views.PostShow = Backbone.View.extend({
  template: JST["post_show"],
  
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },
  
  events: {
    "dblclick #show-title" : "swapTitle",
    "dblclick #show-body" : "swapBody",
    "blur #text-title" : "saveTitle",
    "blur #text-body" : "saveBody"
  },
  
  swapTitle: function() {
    var currTitle = $("#show-title").text();
    $("#show-title").html("<textarea id='text-title'>"+ currTitle +"</textarea>");
  },
  
  swapBody: function() {
    var currBody = $("#show-body").text();
    $("#show-body").html("<textarea id='text-body'>"+ currBody +"</textarea>");
  },
  
  saveTitle: function () {
    var title = $("#text-title").val();
    var postAttributes = { title: title };
    this.model.save(postAttributes, {
      success: function() { console.log("post saved") }
    });
    $("#text-title").html("<h3 id='show-title'>" + title + "</h3>");
  },
  
  saveBody: function () {
    var body = $("#text-body").val();
    var postAttributes = { body: body };
    this.model.save(postAttributes, {
      success: function() { console.log("post saved") }
    });
    $("#text-body").html("<p id='show-body'>" + body + "</p>");
  },
  
  render: function() {
    var content = this.template({
      post: this.model
    });
    this.$el.html(content);
    return this;
  }
});