-- RUBENFOOD MOD
-- A mod written by rubenwardy that adds
-- food to the minetest game
-- =====================================
-- >> rubenfood/init.lua
-- inits the mod
-- =====================================
-- [regis-item] Cup
-- [craft] Cup
-- =====================================

print ("Food: Loading mainframe: [Master]")

--NODE_IMPLEMENT() Gets an item from another mod softly
-- modname: the name of the mod that the item will be got from
-- n_ext: the name of the item that we want to get
-- n_int: the name we want to save the item so we can load it as an ingredient
-- resultfunc: if the mod does not exist, then do this function
function node_implement(modname,n_ext,n_int,resultfunc)
         if not minetest.get_modpath(modname) then
            -- Mod is NOT installed
            resultfunc()
         else
            -- Mod IS installed
            minetest.register_alias(n_int,n_ext)
         end
end

----------------------Load Files-----------------------------
dofile(minetest.get_modpath("food").."/support.lua")
dofile(minetest.get_modpath("food").."/dairy.lua")


----------------------------Cup------------------------------

minetest.register_node("food:mug",{
	description = "Mug",
	inventory_image = "food_mug.png",
	tiles = {"food_bowl_texture.png"},
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
	drawtype="nodebox",
	paramtype = "light",
	walkable = false,
	sunlight_propagates = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125000,-0.500000,-0.125000,0.062500,-0.437500,0.062500}, --NodeBox 1
			{0.062500,-0.437500,-0.125000,0.125000,0.000000,0.062500}, --NodeBox 3
			{-0.187500,-0.437500,-0.125000,-0.125000,0.000000,0.062500}, --NodeBox 4
			{-0.125000,-0.437500,0.062500,0.062500,0.000000,0.125000}, --NodeBox 5
			{-0.125000,-0.437500,-0.187500,0.062500,0.000000,-0.125000}, --NodeBox 6
			{-0.312500,-0.125000,-0.062500,-0.187500,-0.062500,0.000000}, --NodeBox 6
			{-0.312500,-0.312500,-0.062500,-0.187500,-0.250000,0.000000}, --NodeBox 7
			{-0.375000,-0.250000,-0.062500,-0.312500,-0.125000,0.000000}, --NodeBox 8
		}
	}

})

minetest.register_craftitem("food:clay_mug",{
	description = "Clay Mug",
	inventory_image = "food_clay_mug.png",
})

minetest.register_craft({
	output = '"food:clay_mug" 1',
	recipe = {
		{"default:clay_lump","","default:clay_lump"},
		{"default:clay_lump","","default:clay_lump"},
		{"default:clay_lump","default:clay_lump","default:clay_lump"},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "food:mug",
	recipe = "food:clay_mug",
})

-----------------------------Bowl-------------------------------

minetest.register_node("food:bowl",{
	description = "Bowl",
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
	inventory_image = "food_bowl.png",
	tiles = {
		"food_bowl_texture_top.png",
		"food_bowl_texture.png",
		"food_bowl_texture.png",
		"food_bowl_texture.png",
		"food_bowl_texture.png",
		"food_bowl_texture.png",
	},
	walkable = false,
	sunlight_propagates = true,
	drawtype="nodebox",
	paramtype = "light",
	node_box = {
	type = "fixed",
	fixed = {
		{-0.187500,-0.500000,-0.187500,0.187500,-0.437500,0.187500}, --NodeBox 1
		{-0.250000,-0.437500,-0.250000,0.250000,-0.375000,0.250000}, --NodeBox 2
		{-0.312500,-0.375000,-0.312500,0.312500,-0.250000,0.312500}, --NodeBox 3
	}
}

})


-----------------------------Sugar------------------------------
minetest.register_craftitem("food:sugar", {
	description = "Sugar",
	inventory_image = "food_sugar.png",
})
minetest.register_craft({
	output = '"food:sugar" 20',
	recipe = {
		{'"default:papyrus"'},

	}
})

--------------------------Cactus Slice--------------------------
minetest.register_craftitem("food:cactus_slice", {
	description = "Cactus Slice",
	inventory_image = "food_cactus_slice.png",
	on_use = minetest.item_eat(2),
})
minetest.register_craft({
	output = "food:cactus_slice 4",
	recipe = {
		{'"default:cactus"'},

	}
})

------------------------Pasta----------------------------------
minetest.register_craftitem("food:pasta", {
	description = "Pasta",
	inventory_image = "food_pasta.png",
})

minetest.register_craft({
	output = "food:pasta 4",
	type = "shapeless",
	recipe = {"food:flour","food:egg","food:egg"}
})

print("Food: Mainframe loaded")
