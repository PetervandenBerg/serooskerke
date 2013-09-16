class AddImpressionIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :impression_id, :integer
  end
end
