class RemoveColumnsFromGames < ActiveRecord::Migration
  def up
    remove_column :games, :player1_id
    remove_column :games, :player2_id
    remove_column :games, :winner_player_id
    remove_column :games, :status
    remove_column :games, :current_turn
  end

  def down
    add_column :games, :player1_id
    add_column :games, :player2_id
    add_column :games, :winner_player_id
    add_column :games, :status
    add_column :games, :current_turn
  end
end
