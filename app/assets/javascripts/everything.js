// window.root = {
//   Models: {},
//   Collections: {},
//   Routers: {},
//   Views: {},
//   initialize: function () {
//     alert("Backbone Root");
//   }
// }

window.Home = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {},
  initialize: function () {
    var user = new Home.Models.CurrentUser();
    new Home.Routers.Router({
      infoPanel: $(".home-info-panel"),
      user: user
    });
    Backbone.history.start();
  }
}
