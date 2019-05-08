class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  # ::my_all
  #   returns all classifications (FAILED - 5)

  # #longest
  #   returns the classifications for the longest boat (FAILED - 6)
end
