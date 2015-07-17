LynxIn.Views.Profile = Backbone.View.extend({
  template: JST["profile/profile"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.currentId = parseInt($(".home-container").attr("current-id"));
    this.requested = false;
    this.connected = false;
  },

  events: {
    "click .connect-button": "connect",
    "click .add-experience-button": "renderForm",
    "submit form": "addExperience"
  },

  render: function () {
    this.checkRequests(); // for info panel
    this.checkConnected();

    if (this.model.attributes.connections){
      var userConnections = this.model.attributes.connections.slice(0, 6);
    } else {
      var userConnections = [];
    }// For connections panel

    this.flag = true;
    if (this.model.attributes.experiences){
      var experiences = this.model.attributes.experiences;
    } else {
      var experiences = [];
    }// for experiences panel

    var content = this.template({
                    user: this.model,
                    userId: parseInt(this.model.escape("id")),
                    currentId: this.currentId,
                    connected: this.connected,
                    requested: this.requested,
                    connections: userConnections,
                    experiences: experiences
                  });
    this.$el.html(content);

    return this;
  },// end of render function /////////////////////////////////

  connect: function () {
    $.ajax({
      url: "/request/" + this.model.id,
      method: "post"
    })
    this.model.fetch();
  },

  checkRequests: function () {
    var requests = this.model.attributes.requests;
    if (requests){
      for (var i = 0; i < requests.length; i++){
        if (requests[i].id === this.currentId) {this.requested = true;}
      }
    }
  },

  checkConnected: function () {
    var connections = this.model.attributes.connections;
    if (connections){
      for (var i = 0; i < connections.length; i++){
        if (connections[i].id === this.currentId) {this.connected = true;}
      }
    }
  },

  //End of info panel helper methods

  renderForm: function (event) {
    if (this.flag) {
      this.$(".profile-experiences").append("<form class='new-experience-form'>Title: <input type='text' name='title'><br>Employer: <input type='text' name='employer'><br>Start date: <input type='date' name='start_date'><br>End date: <input type='date' name='end_date'><br>Description: <textarea name='description'></textarea><br><button>submit</button></form>");
      this.flag = false;
    }
  },

  addExperience: function (event) {
    event.preventDefault();
    var attr = $(event.target).serializeJSON();
    var experience = new LynxIn.Models.Experience(attr);
    experience.save();
    this.model.fetch();
  }

})//End of everything////////
