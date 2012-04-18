class Raffler.Models.Entry extends Backbone.Model

  toggleDone: ->
    @set(completed: !@attributes['completed'], updated_at: Date.now())
    @save()
    @trigger('toggled')