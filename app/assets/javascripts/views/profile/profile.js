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
    "click .add-experience-button": "renderNewForm",
    "submit .new-experience-form": "addExperience",
    "click .cancel-button": "cancelNewForm",
    "click .delete-experience-button": "deleteExperience",
    "click .edit-experience-button": "renderEditForm",
    "submit .edit-experience-form": "editExperience"
  },

  render: function () {
    this.checkRequests(); // for info panel
    this.checkConnected();

    if (this.model.attributes.connections){
      var userConnections = this.model.attributes.connections.slice(0, 8);
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

  //End of info panel helper methods///////////////////////////////

  renderNewForm: function (event) {
    var temp = JST["profile/newform"];
    var form = temp({experience: {}})
    if (this.flag) {
      this.$(".profile-experiences").append(form);
      this.flag = false;
    }
  },

  cancelNewForm: function (event) {
    event.preventDefault();
    $(".new-experience-form").remove();
    this.flag = true;
  },

  addExperience: function (event) {
    event.preventDefault();
    var model = this.model;
    this.$(".save-button").prop("disabled", true);
    var attr = $(event.target).serializeJSON();
    $.ajax({
      url: "/experiences",
      method: "POST",
      data: attr,
      complete: function () {model.fetch();}
    });
  },

  deleteExperience: function (event) {
    var model = this.model;
    $.ajax({
      url: "/experiences/" + $(event.target).attr("experience-id"),
      method: "delete",
      complete: function () {
        model.fetch();
      }
    });
  },

  renderEditForm: function (event){
    var temp = JST["profile/editform"];
    var id = $(event.target).attr("experience-id");
    var employer = this.$("." + id).find(".employer").html();
    var title = this.$("." + id).find(".title").html();
    var description = this.$("." + id).find(".description").html();
    var start = this.$("." + id).find(".start").html();
    var end = this.$("." + id).find(".end").html();
    var experience = {
          id: id,
          employer: employer,
          title: title,
          description: description,
          start_date: start,
          end_date: end
        }
    this.$("." + id).html(temp({experience: experience}));
  },

  editExperience: function () {
    event.preventDefault();
    var model = this.model;
    var id = $(event.target).attr("data-id");
    var experience = $(event.target).serializeJSON();
    experience.id = id;
    $.ajax({
      url: "/experiences/" + id,
      method: "PUT",
      data: experience,
      complete: function () {
        model.fetch();
      }
    });
  }

//end of experiences panel helper_methods////////////////////////////

})//End of everything////////
