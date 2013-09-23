class ChangeStringToText < ActiveRecord::Migration
  def change
  	change_column :impressions, :description, :text, :limit => 65535
  	change_column :surroundings, :description, :text, :limit => 65535
  end
end
