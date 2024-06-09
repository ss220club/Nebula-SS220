/decl/chemical_reaction/arithrazine
	name = "Arithrazine"
	result = /decl/material/liquid/antirads/arithrazine
	required_reagents = list(/decl/material/liquid/antirads = 1, /decl/material/liquid/fuel/hydrazine = 1)
	result_amount = 2

/decl/chemical_reaction/dermaline
	name = "Dermaline"
	result = /decl/material/liquid/burn_meds/dermaline
	required_reagents = list(/decl/material/liquid/acetone = 1, /decl/material/solid/phosphorus = 1, /decl/material/liquid/burn_meds = 1)
	result_amount = 3
	minimum_temperature = -150 CELSIUS
	maximum_temperature = -50 CELSIUS

/decl/chemical_reaction/oxy_meds
	name = "Dexalin"
	result_amount = 1
	required_reagents = list(/decl/material/liquid/acetone = 1, /decl/material/liquid/acid = 0.1)
	catalysts = list(/decl/material/solid/metal/tungsten = 5)

/decl/chemical_reaction/dexalinp
	name = "Dexalin Plus"
	result = /decl/material/liquid/oxy_meds/dexalinp
	required_reagents = list(/decl/material/liquid/oxy_meds = 1, /decl/material/solid/carbon = 1, /decl/material/solid/metal/iron = 1)
	result_amount = 3

/decl/chemical_reaction/paracetamol
	name = "Paracetamol"
	result = /decl/material/liquid/painkillers/paracetamol
	required_reagents = list(/decl/material/liquid/ethanol = 1, /decl/material/liquid/nutriment/sugar = 1, /decl/material/liquid/water = 1)
	result_amount = 3

/decl/chemical_reaction/nefopam
	name = "Nefopam"
	result = /decl/material/liquid/painkillers/nefopam
	required_reagents = list(/decl/material/solid/carbon = 1, /decl/material/liquid/painkillers/paracetamol = 3)
	result_amount = 1

/decl/chemical_reaction/painkillers
	name = "Tramadol"
	result = /decl/material/liquid/painkillers
	required_reagents = list(/decl/material/liquid/opium = 1, /decl/material/liquid/ethanol = 1, /decl/material/liquid/acetone = 1)
	result_amount = 3

/decl/chemical_reaction/morphine
	name = "Morphine"
	result = /decl/material/liquid/painkillers/morphine
	required_reagents = list(/decl/material/liquid/opium = 1, /decl/material/liquid/painkillers = 1)
	result_amount = 2

/decl/chemical_reaction/fentanyl
	name = "Fentanyl"
	result = /decl/material/liquid/painkillers/fentanyl
	required_reagents = list(/decl/material/liquid/opium = 1, /decl/material/liquid/painkillers/morphine = 1, /decl/material/liquid/sedatives = 1, /decl/material/liquid/hallucinogenics = 1)
	result_amount = 2

/decl/chemical_reaction/paroxetine
	name = "Paroxetine"
	result = /decl/material/liquid/antidepressants/paroxetine
	required_reagents = list(/decl/material/liquid/hallucinogenics = 1, /decl/material/liquid/acetone = 1, /decl/material/liquid/stabilizer = 1)
	result_amount = 3