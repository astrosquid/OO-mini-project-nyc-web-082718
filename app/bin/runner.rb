require_relative '../models/Allergen'
require_relative '../models/Ingredient'
require_relative '../models/Recipe'
require_relative '../models/RecipeCard'
require_relative '../models/RecipeIngredient'
require_relative '../models/User'

require 'pry'

i1 = Ingredient.new('chili powder')
i2 = Ingredient.new('pasta')
i3 = Ingredient.new('bananas')

u1 = User.new
u2 = User.new
u3 = User.new

r1 = Recipe.new
r2 = Recipe.new
r3 = Recipe.new

a1 = Allergen.new(u1, i1)
a2 = Allergen.new(u2, i2)
a3 = Allergen.new(u2, i3)
a4 = Allergen.new(u2, i1)

ri1 = RecipeIngredient.new(i1, r1)
ri2 = RecipeIngredient.new(i1, r2)
ri3 = RecipeIngredient.new(i2, r2)
ri4 = RecipeIngredient.new(i1, r3)
ri5 = RecipeIngredient.new(i2, r3)
ri6 = RecipeIngredient.new(i3, r3)

rc1 = RecipeCard.new(u3, r1, nil, 1)
rc2 = RecipeCard.new(u2, r2, nil, 2)
rc3 = RecipeCard.new(u2, r3, nil, 3)
rc4 = RecipeCard.new(u3, r2, nil, 4)
rc5 = RecipeCard.new(u3, r2, nil, 5)
rc6 = RecipeCard.new(u3, r3, nil, 6)

binding.pry
