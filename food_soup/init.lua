-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/food/soup.lua
-- adds soup and stews
-- =====================================
-- 
-- =====================================

print "Food [Master] - Loading Soups and Stews"

----------------------Tomato-----------------------------
minetest.register_craftitem("food_soup:tomato", {
	description = "Tomato Soup",
	inventory_image = "food_soup_tomato.png",
	on_use = minetest.item_eat(4),
	groups={food=2},
})

minetest.register_craftitem("food_soup:tomato_raw", {
	description = "Raw Tomato Soup",
	inventory_image = "food_soup_tomato_raw.png",
	groups={food=2},
})

food.recipe({
	type = "cooking",
	output = "food_soup:tomato",
	recipe = "food_soup:tomato_raw",
})

food.recipe({
	output = '"food_soup:tomato_raw" 1',
	recipe = {
        	{"", "", ""},
        	{"bucket:bucket_water", "food:tomato", "bucket:bucket_water"},
		{"", "food:bowl", ""},
        },
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})


----------------------Chicken-----------------------------
minetest.register_craftitem("food_soup:chicken", {
	description = "Chicken Soup",
	inventory_image = "food_soup_chicken.png",
	on_use = minetest.item_eat(4),
	groups={food=2},
})

minetest.register_craftitem("food_soup:chicken_raw", {
	description = "Raw Chicken Soup",
	inventory_image = "food_soup_chicken_raw.png",
	groups={food=2},
})

food.recipe({
	type = "cooking",
	output = "food_soup:chicken",
	recipe = "food_soup:chicken_raw",
})

food.recipe({
	output = '"food_soup:chicken_raw" 1',
	recipe = {
        	{"", "", ""},
        	{"bucket:bucket_water", "food:meat", "bucket:bucket_water"},
		{"", "food:bowl", ""},
        },
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})
