class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.integer :player1_id
    	t.integer :player2_id
    	t.integer :current_turn, :default => nil
    	t.integer :winner_player_id, :default => nil

      t.timestamps
    end
  end
end
