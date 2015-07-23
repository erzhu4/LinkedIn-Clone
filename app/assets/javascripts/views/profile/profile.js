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
    "click .editable-experience": "renderEditForm",
    "click .ex-edit-save": "editExperience",
    "click .ex-edit-cancel": "cancelEditEx",
    "click .add-education-button": "renderNewEducation",
    "submit .new-education-form": "addEducation",
    "click .ecancel-button": "cancelNewEd",
    "click .delete-education-button": "deleteEducation",
    "click .editable-education": "renderEditEducation",
    "click .eeditsave-button": "editEducation",
    "click .eeditcancel-button": "cancelEditEd"
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

    this.eflag = true;
    if (this.model.attributes.educations){
      var educations = this.model.attributes.educations;
    } else {
      var educations = [];
    }//for education panel
    var content = this.template({
                    user: this.model,
                    userId: parseInt(this.model.escape("id")),
                    currentId: this.currentId,
                    connected: this.connected,
                    requested: this.requested,
                    connections: userConnections,
                    experiences: experiences,
                    educations: educations
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
    if (this.flag) {
      this.$(".new-ex-form-container").addClass("drop");
      this.flag = false;
    }
  },

  cancelNewForm: function (event) {
    event.preventDefault();
    $(".new-ex-form-container").removeClass("drop");
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
    $(event.currentTarget).removeClass("editable-experience");
    var temp = JST["profile/editform"];
    var id = $(event.currentTarget).attr("data-id");
    var employer = this.$(".ex" + id).find(".employer").html();
    var title = this.$(".ex" + id).find(".title").html();
    var description = this.$(".ex" + id).find(".description").html();
    var start = this.$(".ex" + id).find(".start").html();
    var end = this.$(".ex" + id).find(".end").html();
    var experience = {
          id: id,
          employer: employer,
          title: title,
          description: description,
          start_date: start,
          end_date: end
        }
    this.$(".ex" + id).html(temp({experience: experience}));
  },

  editExperience: function (event) {
    event.preventDefault();
    var model = this.model;
    var id = $(event.target).attr("data-id");
    var experience = $("."+ $(event.target).attr("form-name")).serializeJSON();
    experience.id = id;
    $.ajax({
      url: "/experiences/" + id,
      method: "PUT",
      data: experience,
      complete: function () {
        model.fetch();
      }
    });
  },

  cancelEditEx: function (event) {
    event.preventDefault();
    this.render();
  },

//end of experiences panel helper_methods////////////////////////////

  renderNewEducation: function () {
    if (this.eflag){
      this.$(".new-ed-form-container").addClass("drop-ed");
      this.eflag = false;
    }
  },

  addEducation: function (event) {
    event.preventDefault();
    var params = $(event.target).serializeJSON();
    this.$(".esave-button").prop("disabled", true);
    var model = this.model;
    $.ajax({
      url: "/educations",
      method: "POST",
      data: params,
      complete: function () { model.fetch(); }
    })
  },

  cancelNewEd: function (event) {
    event.preventDefault();
    $(".new-ed-form-container").removeClass("drop-ed");
    this.eflag = true;
  },

  deleteEducation: function (event) {
    var model = this.model;
    $.ajax({
      url: "/educations/" + $(event.target).attr("education-id"),
      method: "DELETE",
      complete: function () { model.fetch(); }
    })
  },

  renderEditEducation: function (event) {
    $(event.currentTarget).removeClass("editable-education");
    var temp = JST["profile/educationedit"];
    var id = $(event.currentTarget).attr("data-id");
    var school = this.$(".ed" + id).find(".school").html();
    var field = this.$(".ed" + id).find(".field").html();
    var year = this.$(".ed" + id).find(".year").html();
    var education = {
          id: id,
          school: school,
          field: field,
          graduation_year: year,
        }
    this.$(".ed" + id).html(temp({education: education}));
  },

  editEducation: function (event) {
    event.preventDefault();
    var model = this.model;
    var attrs = $("." + $(event.target).attr("form-name")).serializeJSON();
    attrs.id = $(event.target).attr("data-id");
    $.ajax({
      url: "/educations/" + attrs.id,
      method: "PUT",
      data: attrs,
      complete: function () {
        model.fetch();
        $(".ed" + attrs.id).addClass("editable-education");
      }
    });
  },

  cancelEditEd: function (event) {
    event.preventDefault();
    this.render();
  }

})//End of everything////////
