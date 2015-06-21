class Article < ActiveRecord::Base
  belongs_to :editor
  
  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def self.search_catalog(query)
  	where("catalog = ?", query)
  end
end
