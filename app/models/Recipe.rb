class Recipe
  @@all = []

  def self.all
    @@all
  end

  def self.most_popular
    recipe_counts = {}
    RecipeCard.all.each do |rc|
      if recipe_counts.keys.include? rc.recipe
        recipe_counts[rc.recipe] += 1
      else
        recipe_counts[rc.recipe] = 1
      end
    end

    recipe_counts.key(recipe_counts.values.max)
  end

  def initialize
    @@all << self
  end

  def users
    User.all.select do |user|
      user.recipes.include?(self)
    end
  end

  def ingredients
    RecipeIngredient.all.select do |recipe_ingredient|
      recipe_ingredient.recipe == self
    end.map do |ri|
      ri.ingredient
    end
  end

  def allergens
    Allergen.all.select do |allergen|
      ingredients.each do |ingredient|
        allergen.ingredient == ingredient
      end
    end
  end

  def add_ingredients(ingredients)
    ingredients.each do |ingredient|
      RecipeIngredient.new(ingredient, self)
    end
  end

end
