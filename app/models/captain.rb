class Captain < ActiveRecord::Base
  has_many :boats

  # ::catamaran_operators
  #   returns all captains of catamarans (FAILED - 1)
  def self.catamaran_operators

    Boat.includes(:classifications).where(classifications: {name: "Catamaran"}).map(&:captain)
  end

  # ::sailors
  #   returns captains with sailboats (FAILED - 2)
  def self.sailors
    Boat.sailboats.map(&:captain).compact
  end
  # ::talented_seafarers
  #   returns captains of motorboats and sailboats (FAILED - 3) ##Array Intersection
  def self.talented_seafarers
    Boat.includes(:classifications).where()
  end

  # ::non_sailors
  #   returns people who are not captains of sailboats (FAILED - 4)
  def self.non_sailors

  end
end
