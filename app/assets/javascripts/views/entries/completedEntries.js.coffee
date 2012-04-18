class Raffler.Views.CompletedIndex extends Backbone.View

  template: JST['entries/completedIndex']

  initialize: ->
    @collection.on('reset', @render, this)

  render: (n = 5) ->
    $(@el).html(@template())
    completed = @collection.last(n)
    completed.forEach(@appendEntry)
    @

  appendEntry: (entry) =>
    view = new Raffler.Views.Entry(model: entry)
    @$('#completed-entries').append(view.render().el)
