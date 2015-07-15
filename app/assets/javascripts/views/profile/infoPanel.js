Profile.Views.InfoPanel = Backbone.View.extend({
  template: JST["profile/infoPanel"],

  initialize: function () {
    this.requested = false;
    this.connected = false;
    this.currentId = parseInt($(".profile-container").attr("current-id"));
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click .connect-button": "connect"
  },

  render: function () {
    this.checkRequests();
    this.checkConnected();
    var content = this.template({
                    requested: this.requested,
                    connected: this.connected,
                    user: this.model,
                    currentId: this.currentId
                  });
    this.$el.html(content);
    return this;
  },

  connect: function () {
    alert("Connect request send!");
    $.ajax({
      url: "/request/" + this.model.id,
      method: "post"
    })
    this.model.fetch();
  },

  checkRequests: function () {
    var requests = this.model.attributes.requests;
    if (requests){
      for (var i = 0; i < requests.length; i++){
        if (requests[i].id === this.currentId) {this.requested = true;}
      }
    }
  },

  checkConnected: function () {
    var connections = this.model.attributes.connections;
    if (connections){
      for (var i = 0; i < connections.length; i++){
        if (connections[i].id === this.currentId) {this.connected = true;}
      }
    }
  }

})
