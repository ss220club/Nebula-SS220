// RENAMED:
/decl/material/liquid/painkillers/strong
	name = "tramadol"
	lore_text = "A simple, yet effective opioid painkiller. Don't mix with alcohol."
	sedation = 0.05
	additional_effect_threshold = 20
	breathloss_severity = 1
	slowdown_severity = 1.2
	blurred_vision = 0.5
	stuttering_severity = 0.5
	weakness_severity = 0
	slur_severity = 0
	confusion_severity = 0.2
	dizziness_severity = 1

// NEW, NOT RENAMED:
/decl/material/liquid/painkillers
	name = "paracetamol"
	lore_text = "Most probably know this as Tylenol, but this chemical is a mild, simple painkiller."
	overdose = 60
	pain_power = 35
	narcotic = FALSE
	breathloss_severity = 0 //Not an opioid. Should not suppress breathing.
	uid = "chem_paracetamol"

// NEW:
/decl/material/liquid/painkillers/nefopam
	name = "nefopam" //better in every way than paracetamol. Very minor side effects.
	lore_text = "A strong, effective non-opioid alternative to tramadol."
	color = "#cfe2f3"
	narcotic = FALSE
	sedation = 0
	additional_effect_threshold = 15
	breathloss_severity = 0 //Not an opioid. Should not suppress breathing.
	slowdown_severity = 0.8 //we should still prevent SOME abuse.
	blurred_vision = 2 //balance
	weakness_severity = 0
	stuttering_severity = 0.2
	slur_severity = 0.2
	confusion_severity = 0
	dizziness_severity = 0.5
	uid = "chem_nefopam"

/decl/material/liquid/painkillers/morphine
	name = "morphine" //similar to tramadol, more effective but more expensive to prepare, also greater side effects
	lore_text = "An effective, strong opioid painkiller. Don't mix with alcohol."
	color = "#864794"
	overdose = 10
	metabolism = 0.02
	pain_power = 160
	effective_dose = 0.20
	sedation = 1
	additional_effect_threshold = 5 //160 pain power is no joke.
	breathloss_severity = 2
	slowdown_severity = 2
	blurred_vision = 0.5
	stuttering_severity = 0.5
	slur_severity = 1
	confusion_severity = 1
	dizziness_severity = 1
	narcotic = TRUE
	uid = "chem_morphine"

/decl/material/liquid/painkillers/fentanyl
	name = "fentanyl" //similar to morphine, but should hit you like a truck and prevent pain shock at all costs
	lore_text = "An incredibly powerful opioid painkiller, often utilized as a surgical sedative. Don't mix with alcohol."
	color = "#cfe2f3"
	overdose = 2 //mix it with water or something else first
	metabolism = 0.01 //but also lasts for a long time
	pain_power = 500
	effective_dose = 0.10
	sedation = 3 //Acts as a sedative, and also prevents antags from taking fentanyl and becoming invincible.
	additional_effect_threshold = 0.25 //Very low threshold. Hard to abuse.
	breathloss_severity = 4
	slowdown_severity = 2
	blurred_vision = 1
	stuttering_severity = 1
	slur_severity = 1
	confusion_severity = 1
	dizziness_severity = 2
	narcotic = TRUE
	uid = "chem_fentanyl"
