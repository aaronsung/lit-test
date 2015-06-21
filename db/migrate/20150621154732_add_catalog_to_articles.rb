class AddCatalogToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :catalog, :string
  end
end
