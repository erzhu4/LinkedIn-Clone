Profile.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.user = options.user;
    this.currentUser = options.currentUser;
    this.$infoPanel = options.infoPanel;
  },

  routes: {
    "": "index"
  },

  index: function () {
    this.user.fetch();
    var view = new Profile.Views.InfoPanel({model: this.user});
    this.swapInfoView(view);
  },

  swapInfoView: function (view) {
    this.infoView && this.infoView.remove();
    this.infoView = view;
    this.$infoPanel.html(this.infoView.render().$el);
  },

  loggedIn: function () {
    return $(".profile-container").attr("current-id") !== "0"
  }

})
