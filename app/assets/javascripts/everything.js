
window.LynxIn = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {},
  initialize: function () {
    var user = new LynxIn.Models.CurrentUser();
    var randoms = new LynxIn.Collections.RandomUsers();
    new LynxIn.Routers.Router({
      rootEl: $(".home-container"),
      randomUsers: randoms,
      user: user,
      toolBar: $(".main-bar")
    });
    Backbone.history.start();
  }
}
