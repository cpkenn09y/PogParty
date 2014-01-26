class CreatePogs < ActiveRecord::Migration
  def change
    create_table :pogs do |t|
    	t.string :name
    	t.string :status, :default => 'face_up'
    	t.string :image_url
    	t.integer :creator_id
    	t.belongs_to :player
    	t.belongs_to :game

      t.timestamps
    end
  end
end
