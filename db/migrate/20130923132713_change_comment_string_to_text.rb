class ChangeCommentStringToText < ActiveRecord::Migration
  def change
  	change_column :comments, :message, :text, :limit => 1500
  end
end
