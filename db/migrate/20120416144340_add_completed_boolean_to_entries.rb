class AddCompletedBooleanToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :completed, :boolean, default: false
  end
end
