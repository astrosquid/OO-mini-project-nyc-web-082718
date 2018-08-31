class RecipeCard

  @@all = []

  def self.all
    @@all
  end

  attr_accessor :user, :recipe
  attr_reader :date, :rating

  def initialize(user, recipe, date, rating)
    @user = user
    @recipe = recipe
    @user.recipe_cards << self
    @@all << self
  end

end
