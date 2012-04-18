class Raffler.Models.Entry extends Backbone.Model

  toggleDone: ->
    @set(completed: !@attributes['completed'])
    @save()
    @trigger('toggled')

#
#  score: ->
#    @health || 5

#  hit: ->
#    health = @health || 5
#    @health = health - 1
#    if @health > 0
#      @trigger('hit')
#      console.log("#{@get('name')} got hit, and now it has #{@health} health.  They are #{if @get('completed') then 'completed' else 'not complete'}")
#    else
#      console.log("i'm down!")
#      @set(completed: true)
#      @save()