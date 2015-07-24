LynxIn.Views.Home = Backbone.View.extend({
  template: JST["home/home"],

  initialize: function () {
    this.listenTo(this.model, "sync", function () {
      this.render();
      $(".loading").removeClass("show-load");
    });
    this.listenTo(this.collection, "sync", function () {
      this.render();
      $(".loading").removeClass("show-load");
    });
    this.searchString = "stuff";
  },

  events: {
    "click .edit-info-button": "editInfo",
    "submit .user-form": "submitEdit",
    "accepted": "acceptRequest",
    "submit .search-form": "renderSearch"
  },

  render: function () {
    var content = this.template({user: this.model, randoms: this.collection, searchString: this.searchString});
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
    this.$el.html(this.template({user: this.model, randoms: this.collection}));
  },

  renderSearch: function (event) {
    event.preventDefault();
    this.searchString = $(event.target).serializeJSON().searchString;
    this.render();
  }

})
