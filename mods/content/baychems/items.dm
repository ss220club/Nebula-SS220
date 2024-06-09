/obj/item/chems/hypospray/autoinjector/pouch_auto/oxy_meds
	name = "emergency oxygenation autoinjector"

/obj/item/rig_module/chem_dispenser
	charges = list(
		list("dexalin",       "dexalin",      /decl/material/liquid/oxy_meds,     80),
		list("inaprovaline",  "inaprovaline", /decl/material/liquid/stabilizer,   80),
		list("dylovene",      "dylovene",     /decl/material/liquid/antitoxins,   80),
		list("hyronalin",     "hyronalin",    /decl/material/liquid/antirads,     80),
		list("spaceacillin",  "spaceacillin", /decl/material/liquid/antibiotics,  80),
		list("tramadol",      "tramadol",     /decl/material/liquid/painkillers,  80)
		)

/obj/item/rig_module/chem_dispenser/ninja
	//just over a syringe worth of each. Want more? Go refill. Gives the ninja another reason to have to show their face.
	charges = list(
		list("dexalin",      "dexalin",       /decl/material/liquid/oxy_meds,          20),
		list("inaprovaline", "inaprovaline",  /decl/material/liquid/stabilizer,        20),
		list("dylovene",     "dylovene",      /decl/material/liquid/antitoxins,        20),
		list("glucose",      "glucose",       /decl/material/liquid/nutriment/glucose, 80),
		list("hyronalin",    "hyronalin",     /decl/material/liquid/antirads,          20),
		list("kelotane",     "kelotane",      /decl/material/liquid/burn_meds,         20),
		list("spaceacillin", "spaceacillin",  /decl/material/liquid/antibiotics,       20),
		list("tramadol",     "tramadol",      /decl/material/liquid/painkillers,       20)
		)


DEFINE_CARTRIDGE_FOR_CHEM(opium, /decl/material/liquid/opium)

/obj/item/chems/glass/bottle/opium
	desc = "A small bottle of opium."


/obj/item/chems/glass/bottle/opium/populate_reagents()
	var/opium_amount = round(reagents.maximum_volume / 2)
	add_to_reagents(/decl/material/liquid/opium, opium_amount)
	. = ..()

/obj/machinery/chemical_dispenser/full
	spawn_cartridges = list(
			/obj/item/chems/chem_disp_cartridge/hydrazine,
			/obj/item/chems/chem_disp_cartridge/lithium,
			/obj/item/chems/chem_disp_cartridge/carbon,
			/obj/item/chems/chem_disp_cartridge/ammonia,
			/obj/item/chems/chem_disp_cartridge/acetone,
			/obj/item/chems/chem_disp_cartridge/sodium,
			/obj/item/chems/chem_disp_cartridge/aluminium,
			/obj/item/chems/chem_disp_cartridge/silicon,
			/obj/item/chems/chem_disp_cartridge/phosphorus,
			/obj/item/chems/chem_disp_cartridge/sulfur,
			/obj/item/chems/chem_disp_cartridge/hclacid,
			/obj/item/chems/chem_disp_cartridge/potassium,
			/obj/item/chems/chem_disp_cartridge/iron,
			/obj/item/chems/chem_disp_cartridge/copper,
			/obj/item/chems/chem_disp_cartridge/mercury,
			/obj/item/chems/chem_disp_cartridge/radium,
			/obj/item/chems/chem_disp_cartridge/water,
			/obj/item/chems/chem_disp_cartridge/ethanol,
			/obj/item/chems/chem_disp_cartridge/sugar,
			/obj/item/chems/chem_disp_cartridge/sacid,
			/obj/item/chems/chem_disp_cartridge/tungsten,
			/obj/item/chems/chem_disp_cartridge/opium
		)
