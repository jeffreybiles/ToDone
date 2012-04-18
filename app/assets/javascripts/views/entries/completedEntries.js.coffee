class Raffler.Views.CompletedIndex extends Backbone.View

  template: JST['entries/completedIndex']

  initialize: ->
    @collection.on('reset', @render, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendEntry)
    @

  appendEntry: (entry) =>
    view = new Raffler.Views.Entry(model: entry)
    @$('#completed-entries').append(view.render().el)
