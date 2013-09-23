class ChangeImpressionStringToText < ActiveRecord::Migration
  def change
  	change_column :impressions, :description, :text, :limit => 4294967295
  	change_column :surroundings, :description, :text, :limit => 4294967295
  end
end
