LynxIn.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.currentUser = options.user;
    this.randomUsers = options.randomUsers;
    this.$rootEl = options.rootEl;
    this.$toolBar = options.toolBar;
  },

  routes: {
    "": "index",
    "profile/:id": "profileShow"
  },

  index: function () {
    this.currentUser.fetch();
    this.randomUsers.fetch();
    var view = new LynxIn.Views.Home({model: this.currentUser, collection: this.randomUsers});
    this.swapView(view);
    $(".accept-button").on("click", function (){view.model.trigger("accepted")});
  },

  profileShow: function (id){
    var user = new LynxIn.Models.User({id: parseInt(id)});
    user.fetch();
    var view = new LynxIn.Views.Profile({model: user});
    this.swapView(view);
    $(".accept-button").on("click", function (){view.model.trigger("accepted")});
  },

  swapView: function (view){
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(this.currentView.render().$el);
  }

})
