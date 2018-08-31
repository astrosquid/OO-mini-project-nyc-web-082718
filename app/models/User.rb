class User

  @@all = []

  def self.all
    @@all
  end

  def initialize
    @@all << self
  end

  def initialize
    @@all << self
  end

  def recipes
    # RecipeCard.all.select { |rc| rc.user == self }.map{ |rc| rc.recipe }
    RecipeCard.all.select do |recipe_card|
      recipe_card.user == self
    end.map do |recipe_card|
      recipe_card.recipe
    end
  end

  def recipe_cards
    RecipeCard.all.select do |rc|
      rc.user == self
    end
  end

  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(self, recipe, date, rating)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end
  end

  def top_three_recipes
    self.recipe_cards.sort { |x, y| y.rating <=> x.rating }.first 3
  end

  def most_recent_recipe
    RecipeCard.all.select do |rc|
      rc.user == self
    end.last.recipe
  end


  def safe_recipes
    unsafe_recipes = []
    # Allergen -> Ingredient
    # Recipe -> RecipeIngredients -> Ingredient
    a_i = self.allergens.map do |allergen|
      allergen.ingredient
    end

    Recipe.all.each do |recipe|
      recipe_ingredients = recipe.ingredients
      recipe_ingredients.each do |r_i|
        if a_i.include? r_i
          unsafe_recipes << recipe
        end
      end
    end

    unsafe_recipes = unsafe_recipes.uniq

    Recipe.all.select do |recipe|
      if unsafe_recipes.include? recipe
        false
      else
        true
      end
    end
  end
end
