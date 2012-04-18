class Raffler.Routers.Entries extends Backbone.Router
  routes:
    '': 'index'
    'entries/:id': 'show'

  initialize: ->
    @collection = new Raffler.Collections.Entries()
    @collection.reset($('#container').data('entries'))

  index: ->
    incompleteCollection = new Raffler.Collections.Entries(@collection.filter((n) -> !n.get('completed')))
    view = new Raffler.Views.EntriesIndex(collection: incompleteCollection)
    completeCollection = new Raffler.Collections.Entries(@collection.filter((n) -> n.get('completed')))
    completedView = new Raffler.Views.CompletedIndex(collection: completeCollection)
    $('#container').html(completedView.render().el)
    $('#container').append(view.render().el)


  show: (id) ->
    alert "Entry #{id}"