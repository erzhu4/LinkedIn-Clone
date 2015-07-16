Profile.Views.ExperiencesPanel = Backbone.View.extend({
  template: JST["profile/experiencesPanel"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    if (this.model.attributes.experiences){
      var experiences = this.model.attributes.experiences;
    } else {
      var experiences = [];
    }
    var content = this.template({experiences: experiences});
    this.$el.html(content);
    return this;
  }

})
