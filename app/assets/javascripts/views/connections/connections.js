LynxIn.Views.Connections = Backbone.View.extend({
  template: JST["connections/connections"],

  initialize: function (options) {
    this.listenTo(this.model, "sync", function () {
      this.render();
      $(".loading").removeClass("show-load");
    });
  },

  events: {
    "click .remove-connection-button": "deleteConnection"
  },

  render: function () {
    var connections = this.model.attributes.connections;
    if (!connections) {connections = [];}
    var content = this.template({connections: connections});
    this.$el.html(content);
    return this;
  },

  deleteConnection: function (event) {
    var model = this.model;
    $.ajax({
      url: "/deleteconnects/" + this.model.id + "/" + $(event.target).attr("user-id"),
      method: "POST",
      complete: function () {
        model.fetch();
      }
    });
  }

})
