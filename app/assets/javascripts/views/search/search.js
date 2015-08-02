LynxIn.Views.SearchResults = Backbone.View.extend({
  template: JST["search/search"],

  initialize: function(){
    this.listenTo(this.collection, "sync", function () {
      this.render();
      $(".loading").removeClass("show-load");
    });
  },

  render: function (){
    var content = this.template({searches: this.collection});
    this.$el.html(content);
    return this;
  }

})
