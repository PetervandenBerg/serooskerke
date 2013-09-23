class CreateSurroundings < ActiveRecord::Migration
  def change
    create_table :surroundings do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
