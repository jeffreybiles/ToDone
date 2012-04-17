class Entry < ActiveRecord::Base
  attr_accessible :name, :winner, :completed
  validates_presence_of :name
end
