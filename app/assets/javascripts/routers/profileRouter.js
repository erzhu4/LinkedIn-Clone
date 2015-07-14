Profile.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.user = options.user;
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
  }

})
