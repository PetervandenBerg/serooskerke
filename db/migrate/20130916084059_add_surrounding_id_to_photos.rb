class AddSurroundingIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :surrounding_id, :integer
  end
end
