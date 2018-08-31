class Ingredient

  @@all = []

  def self.all
    @@all
  end

  def self.most_common_allergen
    ingredient_count = {}

    Allergen.all.each do |allergen|
      if ingredient_count.keys.include? allergen.ingredient
        ingredient_count[allergen.ingredient] += 1
      else
        ingredient_count[allergen.ingredient] = 1
      end
    end

    most = 0
    ingredient_count.each do |ingred, users|
      if users > most
        most = users
      end
    end

    ingredient_count.key(most)
  end

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end
end
