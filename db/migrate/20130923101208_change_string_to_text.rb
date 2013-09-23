class ChangeStringToText < ActiveRecord::Migration
  def change
  	change_column :impressions, :description, :text, :limit => 1500
  	change_column :surroundings, :description, :text, :limit => 1500
  end
end
