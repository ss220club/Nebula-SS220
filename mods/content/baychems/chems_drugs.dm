/decl/material/liquid/amphetamines
	name = "hyperzine"

/decl/material/liquid/narcotics
	name = "impedrezene"

/decl/material/liquid/sedatives
	name = "midazolam"

/decl/material/liquid/hallucinogenics
	name = "mindbreaker toxin"

/decl/material/liquid/opium
	name = "opium"
	lore_text = "A milky substance extracted from space poppy. Very useful in the creation of opiates."
	taste_description = "incredible bitterness"
	color = "#a68480"
	overdose = REAGENTS_OVERDOSE * 0.5
	value = 2
	uid = "chem_opium"

/decl/material/liquid/opium/affect_blood(var/mob/living/M, var/alien, var/removed, var/datum/reagents/holder)
	M.add_chemical_effect(CE_PAINKILLER, 40)
	M.add_chemical_effect(CE_BLOCKAGE, 10) //raw plant matter in bloodstream
	M.add_chemical_effect(CE_TOXIN, 1)
	SET_STATUS_MAX(M, STAT_SLUR, 40)
	SET_STATUS_MAX(M, STAT_DIZZY, 40)
	SET_STATUS_MAX(M, STAT_BLURRY, 40)