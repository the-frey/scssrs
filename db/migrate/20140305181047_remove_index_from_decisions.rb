class RemoveIndexFromDecisions < ActiveRecord::Migration
  def change
    remove_index :decisions, column: :ip
  end
end
