Profile.Views.ConnectionsPanel = Backbone.View.extend({
  template: JST["profile/connectionsPanel"],

  //this.model is the user owner of the profile page being viewed
  //this.model.attributes

  initialize: function () {
    // this.listenTo(this.model)
  },

  render: function () {
    this.$el.html("blahblahablah")
    return this;
  }

})
