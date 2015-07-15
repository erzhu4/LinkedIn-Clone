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
      feedPanel: $(".home-feed-panel"),
      user: user
    });
    Backbone.history.start();
  }
}

window.Profile = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {},
  initialize: function () {
    if ($(".profile-container").attr("current-id") != "0") {
      var currentUser = new Profile.Models.CurrentUser();
    }
    var user = new Profile.Models.User({
      id: parseInt($(".profile-container").attr("user-id"))
    });
    new Profile.Routers.Router({
      user: user,
      currentUser: currentUser,
      infoPanel: $(".profile-info"),
      experiencesPanel: $(".profile-experiences"),
      educationPanel: $(".profile-education")
    });
    Backbone.history.start();
  }
}
