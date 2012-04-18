class Raffler.Views.Entry extends Backbone.View

  template: JST['entries/entry']
  tagName: 'li'

  events:
    'click .is-done': 'toggleDone'
    'click .delete_button': 'kill'

  initialize: ->
    @model.on('change', @render, this)
    @model.on('toggled', @switchLists, @)

  kill: ->
    @remove()
    @model.destroy()

  switchLists: ->
    @remove()
    if @model.attributes['completed']
      $('#completed-entries').append(@render().el)
      $('#completed-entries').find('li:first-child').remove()
    else
      $('#entries').append(@render().el)

  toggleDone: ->
    @model.toggleDone()

  render: ->
    $(@el).html(@template(entry: @model))
    if @model.get('completed')
      updated_time = new Date(@model.get('updated_at'))
      formatted_updated_time = updated_time.getMonth() + '/' + updated_time.getDate() + ' ' + updated_time.getHours() + ":" + updated_time.getMinutes()
      @$('.time').html(formatted_updated_time)
    else
      created_time = new Date(@model.get('created_at'))
      time_created_ago = new Date(new Date() - created_time)
      @$('.time').html(Math.round(time_created_ago*10/(1000*60*60*24))/10)
    @delegateEvents()
    @
