class Article < ActiveRecord::Base
  belongs_to :editor
  has_many :comments
  mount_uploader :upload, DocumentUploader
  validates :title, uniqueness: { message: ": The same Article title has been used before" }
  
  
  def self.search(query)
    where("title like ?", "%#{query}%")
  end

  def self.search_catalog(query)
  	where("catalog = ?", query)
  end
end
