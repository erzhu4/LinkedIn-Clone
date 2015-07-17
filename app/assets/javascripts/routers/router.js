LynxIn.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.user = options.user;
    this.$rootEl = options.rootEl;
  },

  routes: {
    "": "index"
  },

  index: function () {
    this.user.fetch();
    var view = new LynxIn.Views.Info({model: this.user});
    this.swapView(view);
  },

  swapView: function (view){
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(this.currentView.render().$el);
  }

})
