class AddTextToImpressions < ActiveRecord::Migration
  def change
    add_column :impressions, :title, :string
    add_column :impressions, :description, :string
  end
end
