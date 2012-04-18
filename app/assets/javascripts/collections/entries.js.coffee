class Raffler.Collections.Entries extends Backbone.Collection
   url: '/api/entries'
   model: Raffler.Models.Entry
   comparator: (entry) -> entry.get('updated_at')



