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

minetest.register_craftitem("food:mug",{
	description = "Mug",
	inventory_image = "food_mug.png",
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
	tiles = {"food_bowl_texture.png"},
	drawtype="nodebox",
	paramtype = "light",
	node_box = {
	type = "fixed",
	fixed = {
		{-0.250000,-0.500000,-0.250000,0.250000,-0.450000,0.250000}, --NodeBox 1
		{-0.300000,-0.450000,-0.318750,0.309375,-0.400000,0.337500}, --NodeBox 2
		{-0.393750,-0.403125,-0.393750,0.403125,-0.353125,0.412500}, --NodeBox 3
		{-0.450000,-0.356250,-0.440625,-0.337500,-0.306250,0.450000}, --Rim 1
		{-0.431250,-0.356250,-0.440625,0.459375,-0.300000,-0.296880}, --Rim 2
		{0.300000,-0.356250,-0.306255,0.459375,-0.306250,0.453129}, --Rim 3
		{-0.440625,-0.350000,0.356250,0.459375,-0.300000,0.450000}, --Rim 4
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
	output = '"food:cactus_slice" 4',
	recipe = {
		{'"default:cactus"'},

	}
})

print("Food: Mainframe loaded")
