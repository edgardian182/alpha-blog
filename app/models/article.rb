class Article < ActiveRecord::Base
  
  has_many :article_categories
  has_many :categories, through: :article_categories
  
  belongs_to :user 
  validates :title, presence: {message: "debe estar presente"}, length: {minimum: 3, maximum: 50, message: "es muy corto, minimo 3 caracteres"} 
  validates :description, presence: true, length: {minimum: 10, maximum: 5000}
  validates :user_id, presence: true
end