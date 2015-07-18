LynxIn.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.currentUser = options.user;
    this.$rootEl = options.rootEl;
    this.$toolBar = options.toolBar;
  },

  routes: {
    "": "index",
    "profile/:id": "profileShow"
  },

  index: function () {
    this.currentUser.fetch();
    var view = new LynxIn.Views.Home({model: this.currentUser});
    this.swapView(view);
    this.$toolBar.find(".accept-button").on("click", function (){view.model.trigger("accepted")});
  },

  profileShow: function (id){
    var user = new LynxIn.Models.User({id: id});
    user.fetch();
    var view = new LynxIn.Views.Profile({model: user});
    this.swapView(view);
    this.$toolBar.find(".accept-button").on("click", function (){view.model.trigger("accepted")});
  },

  swapView: function (view){
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(this.currentView.render().$el);
  }

})
