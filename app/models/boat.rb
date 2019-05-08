class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

# Boat
#   ::first_five
#     returns the first five Boats (FAILED - 1)
  def self.first_five
    first(5)
  end

#   ::dinghy
#     returns boats shorter than 20 feet (FAILED - 2)
  def self.dinghy
    # SELECT boats WHERE boat.length < 20
    where("length < 20")
  end

#   ::ship
#     returns boats 20 feet or longer (FAILED - 3)
  def self.ship
    # SELECT boats WHERE boat.length >= 20
    where("length >= 20")
  end

#   ::last_three_alphabetically
#     returns last three boats in alphabetical order (FAILED - 4)
  def self.last_three_alphabetically
    # SELECT boats WHERE boat.name DESC CHOMP first 3
    all.order(name: :desc).first(3)
  end

#   ::without_a_captain
#     returns boats without a captain (FAILED - 5)
  def self.without_a_captain
    # SELECT boats WHERE captain == nil
    where(captain: nil)
  end

#   ::sailboats
#     returns all boats that are sailboats (FAILED - 6)
  def self.sailboats
    includes(:classifications).where(classifications: {name: "Sailboat"})
  end

#   ::with_three_classifications
#     returns boats with three classifications (FAILED - 7)
  def self.with_three_classifications
    # Select boats where classification.count == 3
    # includes(:classifications).where(classifications.count == 3)
    Boat.all.select {|boat| boat.classifications.count == 3}
    # joins(:classifications).group('boats.id').having('COUNT(*)=3').select('boats.*')
  end
  
end
