class CreatePogsTable < ActiveRecord::Migration
  def change
    create_table :pogs do |t|
      t.timestamps
    end
  end
end
