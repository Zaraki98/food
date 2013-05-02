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

print "Food [Master] - Loading Bread"
-- doughs
if not minetest.get_modpath("farming") then

else
minetest.register_craftitem(":farming:cake_mix", {
	description = "Dough",
	inventory_image = "farming_cake_mix.png",
})
end

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




print "Food [Master] - Loading Buns"
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
