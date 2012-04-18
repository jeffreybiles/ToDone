class Raffler.Views.CompletedIndex extends Backbone.View

  template: JST['entries/completedIndex']

#  events:
#    'submit #new_entry': 'createEntry'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendEntry, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendEntry)
    @

  appendEntry: (entry) =>
    view = new Raffler.Views.Entry(model: entry)
    console.log(entry.attributes['completed'])
    @$('#completed-entries').append(view.render().el)

#  createEntry: (event) ->
#    event.preventDefault()
#    attributes = name: $('#new_entry_name').val()
#    @collection.create attributes,
#      wait: true
#      success: $('#new_entry')[0].reset()
#      error: @handleError

#  handleError: (entry, response) ->
#    if response.status == 422
#      errors = $.parseJSON(response.responseText).errors
#      for attribute, messages of errors
#        alert "#{attribute} #{message}" for message in messages
#
