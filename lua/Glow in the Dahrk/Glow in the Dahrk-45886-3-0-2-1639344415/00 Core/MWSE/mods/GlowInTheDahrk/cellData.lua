-- Do not edit this file directly. Instead use the interop library to modify the data.

--- @type table.GitD.cellData
return {
	profiles = {
		["Force Interior Sources On"] = {
			{ mesh = "^i\\in_*", data = { forceIndexOn = true } },
		},
		["Force Exterior Sources On"] = {
			{ mesh = "^x\\ex_*", data = { forceIndexOn = true } },
		},
	},
	definitions = {
		["Vivec, Foreign Quarter Plaza"] = { "Force Exterior Sources On" },
		["Vivec, Hlaalu Plaza"] = { "Force Exterior Sources On" },
		["Vivec, Redoran Plaza"] = { "Force Exterior Sources On" },
		["Vivec, St. Delyn Plaza"] = { "Force Exterior Sources On" },
		["Vivec, St. Olms Plaza"] = { "Force Exterior Sources On" },
		["Vivec, Telvanni Plaza"] = { "Force Exterior Sources On" },
	},
}