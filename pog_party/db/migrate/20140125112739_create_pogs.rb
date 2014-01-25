class CreatePogs < ActiveRecord::Migration
  def change
    create_table :pogs do |t|
    	t.string :name
    	t.string :status, :default => 'unflipped'
    	t.string :image_url
    	t.integer :creator_id
    	t.belongs_to :user
    	t.belongs_to :game

      t.timestamps
    end
  end
end
