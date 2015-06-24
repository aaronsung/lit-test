class AddUploadToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :upload, :string
  end
end
