class Raffler.Views.CompletedIndex extends Backbone.View

  template: JST['entries/completedIndex']

  events: {
     'click .more': 'plusN'
  }

  initialize: ->
    @collection.on('reset', @render, this)
    this.on('more', @render, @)
    @n = 5

  render: () ->
    $(@el).html(@template())
    completed = @collection.last(@n)
    completed.forEach(@appendEntry)
    @

  plusN: ->
    @n *= 2
    @trigger('more')

  appendEntry: (entry) =>
    view = new Raffler.Views.Entry(model: entry)
    @$('#completed-entries').append(view.render().el)
