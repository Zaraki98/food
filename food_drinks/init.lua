-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/drinks/hot.lua
-- adds hot drinks
-- =====================================
-- [regis-food] Coffee
-- [craft] Coffe
-- [regis-food] Hot Chocolate
-- [craft] Hot Chocolate
-- =====================================

print ("Food [Drinks] - Loading Hot")

-----------------------------Coffee-----------------------------

minetest.register_craftitem("food_drinks:coffeebean_cooked",{
	description = "Roasted Coffee Beans",
	tiles = {"food_coffee_cooked.png"},
	inventory_image = "food_coffee_cooked.png",
})

minetest.register_craftitem("food_drinks:coffee", {
	description = "Coffee",
	inventory_image = "food_coffee_cup.png",
	on_use = minetest.item_eat(10),
	groups={food=1},
})

food.recipe({
	output = '"food_drinks:coffee" 1',
	recipe = {
		{'""','"food:coffeebean_cooked"','""'},
		{'""','"food:coffeebean_cooked"','""'},
		{'""','"food:cup"','""'},
	}
})

food.recipe({
	output = '"food_drinks:coffee" 1',
	recipe = {
		{'""','"food:coffeebean_cooked"','""'},
		{'""','"food:coffeebean_cooked"','""'},
		{'""','"food:mug"','""'},
	}
})

food.recipe({
	type = "cooking",
	output = "food_drinks:coffeebean_cooked",
	recipe = "food:coffeebean",
	cooktime = 5,
})

print ("Food [Drinks] - Loading Juices")

--------------------------Apple Juice--------------------------
minetest.register_craftitem("food_drinks:apple_juice", {
	description = "Apple Juice",
	inventory_image = "food_juice_apple.png",
	on_use = minetest.item_eat(2)
})

food.recipe({
	output = '"food_drinks:apple_juice" 4',
	recipe = {
		{"","",""},
		{"","default:apple",""},
		{"","food:cup",""},
	}
})





----------------------cactus juice----------------------------
minetest.register_craftitem("food_drinks:cactus_juice", {
	description = "Cactuz Juice",
	inventory_image = "food_juice_cactus.png",
	on_use = minetest.item_eat(2),
})

food.recipe({
	output = '"food_drinks:cactus_juice" 4',
	recipe = {
		{'""','""','""'},
		{'""','"default:cactus"','""'},
		{'""','"food:cup"','""'},
	}
})



--------------------------Apple Juice--------------------------
minetest.register_craftitem("food_drinks:rainbow_juice", {
	description = "Nyan Rainbow Juice",
	inventory_image = "food_juice_rainbow.png",
	on_use = minetest.item_eat(50)
})

food.recipe({
	output = '"food_drinks:rainbow_juice" 99',
	recipe = {
		{"","",""},
		{"","default:nyancat_rainbow",""},
		{"","food:cup",""},
	}
})