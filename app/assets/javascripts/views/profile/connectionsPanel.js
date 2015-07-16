Profile.Views.ConnectionsPanel = Backbone.View.extend({
  template: JST["profile/connectionsPanel"],

  //this.model is the user owner of the profile page being viewed
  //this.model.attributes

  initialize: function () {
     this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    if (this.model.attributes.connections){
      this.userConnections = this.model.attributes.connections
    } else {
      this.userConnections = [];
    }
    var content = this.template({user: this.model, connections: this.userConnections.slice(0,10)});
    this.$el.html(content);
    return this;
  }

})
