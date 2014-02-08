class AddColumnGameIdToPogs < ActiveRecord::Migration
  def change
    add_column :pogs, :game_id, :integer
  end
end
