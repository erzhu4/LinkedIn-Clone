Home.Views.EditUser = Backbone.View.extend({
  template: JST["home/userForm"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click button": "submit"
  },

  render: function () {
    var content = this.template({user: this.model});
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    console.log(this.$el.serializeJSON());
  }


})
