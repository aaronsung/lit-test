class Article < ActiveRecord::Base
  belongs_to :editor
  
  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
