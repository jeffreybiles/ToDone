class Raffler.Routers.Entries extends Backbone.Router
  routes:
    '': 'index'
    'entries/:id': 'show'

  initialize: ->
    @collection = new Raffler.Collections.Entries()
    @collection.reset($('#container').data('entries'))

  index: ->
    incompleteCollection = @collection.filter((n) -> !n.get('completed'))
    view = new Raffler.Views.EntriesIndex(collection: @collection)
    $('#container').html(view.render().el)


  show: (id) ->
    alert "Entry #{id}"