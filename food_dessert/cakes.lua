-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/snacks/cakes.lua
-- adds cakes
-- =====================================
-- [regis-food] Plain Cake
-- [craft] Plain Cake
-- [regis-food] Chocolate Cake
-- [craft] Chocolate Cake
-- [regis-food] Carrot Cake
-- [craft] Chocolate Cake
-- =====================================
print("Food [Master] - Loading Cakes")

--------------------------Cakes-------------------------
minetest.register_craftitem("food_dessert:cakemix_plain",{
	description = "Cake Mix",
	inventory_image = "food_pastry.png",
})

minetest.register_craftitem("food_dessert:cakemix_choco",{
	description = "Chocolate Cake Mix",
	inventory_image = "food_pastry_choco.png",
})

minetest.register_craftitem("food_dessert:cakemix_carrot",{
	description = "Carrot Cake Mix",
	inventory_image = "food_pastry_carrot.png",
})

minetest.register_craft({
	type = "cooking",
	output = "food_dessert:cake",
	recipe = "food_dessert:cakemix_plain",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "food_dessert:cake_chocolate",
	recipe = "food_dessert:cakemix_choco",
	cooktime = 10,
})

minetest.register_craft({
	type = "cooking",
	output = "food_dessert:cake_carrot",
	recipe = "food_dessert:cakemix_carrot",
	cooktime = 10,
})

minetest.register_node("food_dessert:cake", {
	description = "Cake",
	inventory_image = "food_cake.png",
	on_use = minetest.item_eat(30),
	groups={food=3,crumbly=3},
	tiles = {
		"food_cake_texture.png",
		"food_cake_texture.png",
		"food_cake_texture_side.png",
		"food_cake_texture_side.png",
		"food_cake_texture_side.png",
		"food_cake_texture_side.png"
	},
	drawtype="nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.250000,-0.500000,-0.296880,0.250000,-0.250000,0.312502}, --NodeBox 1
			{-0.309375,-0.500000,-0.250000,0.309375,-0.250000,0.250000}, --NodeBox 2
			{-0.250000,-0.250000,-0.250000,0.250000,-0.200000,0.250000}, --NodeBox 3
		}
	}
})

minetest.register_node("food_dessert:cake_chocolate", {
	description = "Chocolate Cake",
	inventory_image = "food_cake_choco.png",
	on_use = minetest.item_eat(40),
	groups={food=3,crumbly=3},
	tiles = {
		"food_cake_choco_texture.png",
		"food_cake_choco_texture.png",
		"food_cake_choco_texture_side.png",
		"food_cake_choco_texture_side.png",
		"food_cake_choco_texture_side.png",
		"food_cake_choco_texture_side.png"
	},
	drawtype="nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.250000,-0.500000,-0.296880,0.250000,-0.250000,0.312502}, --NodeBox 1
			{-0.309375,-0.500000,-0.250000,0.309375,-0.250000,0.250000}, --NodeBox 2
			{-0.250000,-0.250000,-0.250000,0.250000,-0.200000,0.250000}, --NodeBox 3
		}
	}
})

minetest.register_craftitem("food_dessert:cake_carrot", {
	description = "Carrot Cake",
	inventory_image = "food_cake_carrot.png",
	on_use = minetest.item_eat(40),
	groups={food=3},
})






----------------------------- Cake Pastry ----------------------------

minetest.register_craft({
	output = '"food_dessert:cakemix_plain" 1',
	recipe = {
		{'"food:flour"','"food:sugar"','"food:egg"'},
	}
})

minetest.register_craft({
	output = '"food_dessert:cakemix_choco" 1',
	recipe = {
	{'""','"food:chocolate_milk"','""'},	{'"food:flour"','"food:sugar"','"food:egg"'},
	}
})

minetest.register_craft({
	output = '"food_dessert:cakemix_carrot" 1',
	recipe = {
	{'""','"food:carrot"','""'},	{'"food:flour"','"food:sugar"','"food:egg"'},
	}
})
