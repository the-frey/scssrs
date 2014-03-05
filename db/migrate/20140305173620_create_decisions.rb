class CreateDecisions < ActiveRecord::Migration
  def change
    create_table :decisions do |t|
      t.string :ip
      t.string :player_choice
    end

    add_index :decisions, :ip, unique: true
  end
end
