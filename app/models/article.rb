class Article < ActiveRecord::Base
  belongs_to :editor
  has_many :comments
  mount_uploader :upload, DocumentUploader
  
  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def self.search_catalog(query)
  	where("catalog = ?", query)
  end
end
