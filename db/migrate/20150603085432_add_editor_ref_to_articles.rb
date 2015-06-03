class AddEditorRefToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article, :reference
  end
end
