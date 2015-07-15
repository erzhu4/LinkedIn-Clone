Profile.Views.InfoPanel = Backbone.View.extend({
  template: JST["profile/infoPanel"],

  initialize: function () {
    this.requested = false;
    this.currentId = parseInt($(".profile-container").attr("current-id"));
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click .connect-button": "connect"
  },

  render: function () {
    this.checkRequests();
    var content = this.template({
                    requested: this.requested,
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
  }

})
