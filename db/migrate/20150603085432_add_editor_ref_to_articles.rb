class AddEditorRefToArticles < ActiveRecord::Migration
  def change
    #add_column :articles, :article, :reference
    add_reference :articles, :editor, index: true
    add_foreign_key :articles, :editors
  end
end
