// Profile.Views.ExperiencesPanel = Backbone.View.extend({
//   template: JST["profile/experiencesPanel"],
//
//   initialize: function () {
//     this.listenTo(this.model, "sync", this.render);
//   },
//
//   events:{
//     "click .add-experience-button": "renderForm",
//     "submit form": "addExperience"
//   },
//
//   render: function () {
//     this.flag = true;
//     if (this.model.attributes.experiences){
//       var experiences = this.model.attributes.experiences;
//     } else {
//       var experiences = [];
//     }
//     var content = this.template({user: this.model, experiences: experiences});
//     this.$el.html(content);
//     return this;
//   },
//
//   renderForm: function (event) {
//     if (this.flag) {
//       this.$el.append("<form class='new-experience-form'>Title: <input type='text' name='title'><br>Employer: <input type='text' name='employer'><br>Start date: <input type='date' name='start_date'><br>End date: <input type='date' name='end_date'><br>Description: <textarea name='description'></textarea><br><button>submit</button></form>")
//       this.flag = false
//     }
//   },
//
//   addExperience: function (event) {
//     event.preventDefault();
//     var attr = $(event.target).serializeJSON();
//     var experience = new Profile.Models.Experience(attr);
//     experience.save();
//     this.model.fetch();
//   }
//
// })
