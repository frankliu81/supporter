class Request < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true


  def self.search(search_term)
    #where(["name ILIKE? OR email ILIKE?", "%#{search_term}%", "%#{search_term}%"])
    where(["name ILIKE :term OR email ILIKE :term OR department ILIKE :term OR message ILIKE :term", {term: "%#{search_term}%"} ])
  end


  # Bonus 1: Write a SQL query that returns a sorted list of the departments
  # and the number of support requests per each department
  # can expose this functionality to the app from here
  def self.sorted_list_of_deparments_and_request_count_per_department
    # Do a SQL query instead, SQL query in bonus.sql
    # SELECT department, COUNT(*) FROM requests
    # GROUP BY department
    # ORDER BY department;

  end

end
