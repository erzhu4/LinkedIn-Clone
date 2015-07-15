Profile.Views.InfoPanel = Backbone.View.extend({
  template: JST["profile/infoPanel"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click .connect-button": "connect"
  },

  render: function () {
    var content = this.template({
                                  user: this.model,
                                  currentId: $(".profile-container").attr("current-id")
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
  }

})
