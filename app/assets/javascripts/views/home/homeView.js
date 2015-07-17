LynxIn.Views.Info = Backbone.View.extend({
  template: JST["home/home"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click .edit-info-button": "editInfo",
    "submit .user-form": "submitEdit"
  },

  render: function () {
    var content = this.template({user: this.model});
    this.$el.html(content);
    return this;
  },

  editInfo: function () {
    var temp = JST["home/userForm"];
    var form = temp({user: this.model});
    this.$(".home-info-panel").html(form);
  },

  submitEdit: function (event) {
    event.preventDefault();
    var email = this.$(".email").val()
    var fname = this.$(".fname").val()
    var lname = this.$(".lname").val()
    var title = this.$(".title").val()
    var summary = this.$(".summary").val()
    this.model.set({email: email, fname: fname, lname: lname,
                    title: title, summary: summary})
    this.model.save();
    this.$(".home-info-panel").html(this.template({user: this.model}));
  }

})
