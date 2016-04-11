class Request < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true


  def self.search(search_term)
    #where(["name ILIKE? OR email ILIKE?", "%#{search_term}%", "%#{search_term}%"])
    where(["name ILIKE :term OR email ILIKE :term OR department ILIKE :term OR message ILIKE :term", {term: "%#{search_term}%"} ])
  end
  
end
