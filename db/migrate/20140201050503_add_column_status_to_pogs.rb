class AddColumnStatusToPogs < ActiveRecord::Migration
  def change
    add_column :pogs, :status, :string, :default => "face_down"
  end
end
