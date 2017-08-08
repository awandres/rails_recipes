# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

bob = User.create(email: 'bob@gmail.com', password: 'password')
rec1 = bob.recipes.create({name: "Recipe 1", cooktime: 30, img_url: 'blah.com'})
rec2 = bob.recipes.create({name: "Recipe 2", cooktime: 15, img_url: 'blah.com'})
rec3 = bob.recipes.create({name: "Recipe 3", cooktime: 45, img_url: 'blah.com'})

ing1 = Ingredient.create({name: 'Ingredient 1' })
ing2 = Ingredient.create({name: 'Ingredient 2' })
ing3 = Ingredient.create({name: 'Ingredient 3' })
ing4 = Ingredient.create({name: 'Ingredient 4' })
ing5 = Ingredient.create({name: 'Ingredient 5' })
ing6 = Ingredient.create({name: 'Ingredient 6' })
ing7 = Ingredient.create({name: 'Ingredient 7' })
ing8 = Ingredient.create({name: 'Ingredient 8' })
ing9 = Ingredient.create({name: 'Ingredient 9' })

List.create({recipe: rec1, ingredient: ing1})
List.create({recipe: rec1, ingredient: ing2})
List.create({recipe: rec1, ingredient: ing3})
List.create({recipe: rec1, ingredient: ing4})
List.create({recipe: rec2, ingredient: ing1})
List.create({recipe: rec2, ingredient: ing2})
List.create({recipe: rec2, ingredient: ing3})
List.create({recipe: rec3, ingredient: ing1})
List.create({recipe: rec3, ingredient: ing2})
