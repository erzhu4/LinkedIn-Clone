LynxIn.Views.SearchResults = Backbone.View.extend({
  template: JST["search/search"],

  initialize: function(options){
    this.searches = options.searches;
  },

  render: function (){
    $(".loading").removeClass("show-load");
    var content = this.template({searches: this.searches});
    this.$el.html(content);
    return this;
  }

})
