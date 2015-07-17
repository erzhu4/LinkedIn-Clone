// window.root = {
//   Models: {},
//   Collections: {},
//   Routers: {},
//   Views: {},
//   initialize: function () {
//     alert("Backbone Root");
//   }
// }

window.LynxIn = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {},
  initialize: function () {
    var user = new LynxIn.Models.CurrentUser();
    new LynxIn.Routers.Router({
      rootEl: $(".home-container"),
      user: user
    });
    Backbone.history.start();
  }
}

// window.Profile = {
//   Models: {},
//   Collections: {},
//   Routers: {},
//   Views: {},
//   initialize: function () {
//
//     if ($(".profile-container").attr("current-id") != "0") {
//       var currentUser = new Profile.Models.CurrentUser();
//     } else {
//       var currentUser = {};
//     }
//
//     var user = new Profile.Models.User({
//       id: parseInt($(".profile-container").attr("user-id"))
//     });
//     new Profile.Routers.Router({
//       user: user,
//       currentUser: currentUser,
//       infoPanel: $(".profile-info"),
//       experiencesPanel: $(".profile-experiences"),
//       educationPanel: $(".profile-education"),
//       connectionsPanel: $(".connections-panel")
//     });
//
//     Backbone.history.start();
//   }//end of initialize
//
// }
