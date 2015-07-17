// Profile.Routers.Router = Backbone.Router.extend({
//
//   initialize: function (options) {
//     this.user = options.user;
//     this.currentUser = options.currentUser;
//     this.$infoPanel = options.infoPanel;
//     this.$connectionsPanel = options.connectionsPanel;
//     this.$experiencesPanel = options.experiencesPanel;
//     this.user.fetch();
//   },
//
//   routes: {
//     "": "index"
//   },
//
//   index: function () {
//     var infoView = new Profile.Views.InfoPanel({model: this.user});
//     this.swapInfoView(infoView);
//     var connectionsView = new Profile.Views.ConnectionsPanel({model: this.user});
//     this.swapConnectionsView(connectionsView);
//     var experiencesView = new Profile.Views.ExperiencesPanel({model: this.user});
//     this.swapExperiencesView(experiencesView);
//   },
//
//   swapInfoView: function (view) {
//     this.infoView && this.infoView.remove();
//     this.infoView = view;
//     this.$infoPanel.html(this.infoView.render().$el);
//   },
//
//   swapExperiencesView: function (view){
//     this.experiencesView && this.experiencesView.remove();
//     this.experiencesView = view;
//     this.$experiencesPanel.html(this.experiencesView.render().$el);
//   },
//
//   swapConnectionsView: function (view){
//     this.connectionsView && this.connectionsView.remove();
//     this.connectionsView = view;
//     this.$connectionsPanel.html(this.connectionsView.render().$el);
//   },
//
//   loggedIn: function () {
//     return $(".profile-container").attr("current-id") !== "0"
//   }
//
// })
