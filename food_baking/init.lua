-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/food/baking.lua
-- adds bread and pies
-- =====================================
-- [regis-food] Bread
-- [regis-food] Bread Slice
-- [craft] Bread Slice
-- [regis-food] Bun
-- [craft] Bun
-- [regis-item] Bun Dough
-- [craft] Bun Dough
-- =====================================

print "Food [Baking] - Loading Bread"

-- doughs
if minetest.get_modpath("farming") then
	minetest.register_craftitem(":farming:cake_mix", {
		description = "Dough",
		inventory_image = "farming_cake_mix.png",
	})
	minetest.register_node(":farming:bread", {
		description = "Bread",
		inventory_image = "food_bread.png",
		tiles = {"food_bread_texture.png"},
		stack_max = 1,
		on_use = minetest.item_eat(10),
		groups={food=2,crumbly=3},
		drawtype="nodebox",
		paramtype = "light",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.300000,-0.103125,-0.500000,-0.250000,0.187500,0.500000}, --NodeBox 2
				{-0.250000,-0.500000,-0.500000,0.250000,0.250000,0.500000}, --NodeBox 2
				{0.250000,-0.112500,-0.500000,0.309375,0.187500,0.500000}, --NodeBox 3
				{0.250000,-0.500000,-0.500000,0.318750,-0.337500,0.500000}, --NodeBox 4
				{-0.309375,-0.500000,-0.500000,-0.250000,-0.328125,0.500000}, --NodeBox 5
				{0.309375,-0.056250,-0.500000,0.375000,0.131250,0.500000}, --NodeBox 6
				{-0.350000,-0.065625,-0.500000,-0.300000,0.140625,0.500000}, --NodeBox 7
				{-0.178125,0.250000,-0.500000,0.196875,0.300000,0.500000}, --NodeBox 8
			}
		}
	})
end

node_implement("farming","farming:bread","food_baking:bread",function()
	minetest.register_node("food_baking:bread", {
		description = "Bread",
		inventory_image = "food_bread.png",
		tiles = {"food_bread_texture.png"},
		stack_max = 1,
		on_use = minetest.item_eat(10),
		groups={food=2,crumbly=3},
		drawtype="nodebox",
		paramtype = "light",
		walkable = false,
		sunlight_propagates = true,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.187500,-0.500000,-0.312500,0.187500,0.062500,0.312500}, --Body
				{-0.250000,-0.250000,-0.312500,-0.187500,0.000000,0.312500}, --Left
				{0.187500,-0.250000,-0.312500,0.250000,0.000000,0.312500}, --Right
			}
		}
	})
	minetest.register_craft({
		type = "cooking",
		output = "food_baking:bread",
		recipe = "food_baking:dough",
		cooktime = 10,
	})
end)

node_implement("farming","farming:cake_mix","food_baking:dough",function()
minetest.register_craftitem("food_baking:dough", {
	description = "Cake Mix",
	inventory_image = "farming_cake_mix.png",
})
minetest.register_craft({
	output = "food_baking:dough",
	type = "shapeless",
	recipe = {"food:flour", "food:flour", "food:flour", "food:flour", "bucket:bucket_water"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}},
})
end)

minetest.register_craft({
	output = '"food_baking:bread_slice" 10',
	recipe = {
		{'"food_baking:bread"'},
	}
})

minetest.register_craftitem("food_baking:bread_slice", {
	description = "Bread Slice",
	inventory_image = "food_bread_slice.png",
	on_use = minetest.item_eat(2),
})




print "Food [Baking] - Loading Buns"
minetest.register_craftitem("food_baking:bun_mix", {
	description = "Bun Mix",
	inventory_image = "food_bun_mix.png",
})

minetest.register_craftitem("food_baking:bun", {
	description = "Bun",
	inventory_image = "food_bun.png",
	on_use = minetest.item_eat(4),
	groups={food=2},
})

minetest.register_craft({
	type = "cooking",
	output = "food_baking:bun",
	recipe = "food_baking:bun_mix",
})

minetest.register_craft({
	output = '"food_baking:bun_mix" 5',
	recipe = {
        {"food:flour", "food:flour", "bucket:bucket_water"},
        },
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

print "Food [Baking] - Loading bakes"

minetest.register_craftitem("food_baking:pasta_bake", {
	description = "Pasta Bake",
	inventory_image = "food_baking_pasta_bake.png",
	on_use = minetest.item_eat(8),
	groups={food=2},
})

minetest.register_craft({
	type = "cooking",
	output = "food_baking:pasta_bake",
	recipe = "food_baking:pasta_bake_raw",
})

minetest.register_craftitem("food_baking:pasta_bake_raw", {
	description = "Raw Pasta Bake",
	inventory_image = "food_baking_pasta_bake_raw.png",
})

minetest.register_craft({
	output = "food_baking:pasta_bake_raw",
	recipe = {
		{"food:cheese"},
		{"food:pasta"},
		{"food:bowl"}
	}
})


