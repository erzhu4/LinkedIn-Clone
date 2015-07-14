Home.Views.EditUser = Backbone.View.extend({
  template: JST["home/userForm"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "submit form": "submit"
  },

  render: function () {
    var content = this.template({user: this.model});
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var email = this.$(".email").val()
    var fname = this.$(".fname").val()
    var lname = this.$(".lname").val()
    var title = this.$(".title").val()
    var summary = this.$(".summary").val()
    this.model.set({email: email, fname: fname, lname: lname,
                    title: title, summary: summary})
    this.model.save();
    Backbone.history.navigate("", {trigger: true});
  }


})
