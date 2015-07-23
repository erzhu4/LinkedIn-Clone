LynxIn.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.currentUser = options.user;
    this.randomUsers = options.randomUsers;
    this.$rootEl = options.rootEl;
  },

  routes: {
    "": "index",
    "profile/:id": "profileShow",
    "connections": "connections",
    "connections/:id": "connectionsof"
  },

  index: function () {
    this.currentUser.fetch();
    this.randomUsers.fetch();
    var view = new LynxIn.Views.Home({model: this.currentUser, collection: this.randomUsers});
    this.swapView(view);
    this.configureAcceptHandler(view);
  },

  profileShow: function (id){
    var user = new LynxIn.Models.User({id: parseInt(id)});
    user.fetch();
    var view = new LynxIn.Views.Profile({model: user});
    this.swapView(view);
    this.configureAcceptHandler(view);
  },

  connections: function () {
    this.currentUser.fetch();
    var view = new LynxIn.Views.Connections({model: this.currentUser});
    this.swapView(view);
  },

  connectionsof: function (id) {
    var user = new LynxIn.Models.User({id: parseInt(id)});
    user.fetch();
    var view = new LynxIn.Views.ConnectionsOf({model: user});
    this.swapView(view);
  },

  configureAcceptHandler: function (view) {
    $(".accept-button").off("click");
    $(".accept-button").on("click", function (event) {
      $(event.target).prop("disabled", true)
      $.ajax({
        url: "/request/destroy/" + $(event.target).attr("sender-id") + "/" + $(event.target).attr("responder-id"),
        method: "POST"
      })
      $.ajax({
        url: "/request/destroy/" + $(event.target).attr("responder-id") + "/" + $(event.target).attr("sender-id"),
        method: "POST"
      })
      $("#" + $(event.target).attr("form-id")).html("You have accepted this request.")
      $.ajax({
        url: "/connections/" + $(event.target).attr("sender-id") + "/" + $(event.target).attr("responder-id"),
        method: "POST",
        complete: function () {
          view.model.fetch();
        }
      });
    });
  },

  swapView: function (view){
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(this.currentView.render().$el);
  }

})
