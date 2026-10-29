package apple.hig.menus.menu_title_capitalization
default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
	"deny": [],
	"warn": warnings,
	"note": [],
}

warnings contains {
	"rule_id": "apple.hig.menus.review_command_menu_title_capitalization",
	"message": "Review CommandMenu title; multiword menu titles should use title-style capitalization.",
	"line": call.range.start,
	"column": 0,
	"severity": "warning",
} if {
	walk(input, [_, call])
	call._kind == "call_expr"
	call.fn._kind == "unresolved_decl_ref_expr"
	call.fn.name == "CommandMenu"
	argument := call.args.args[_]
	argument.expr._kind == "string_literal_expr"
	title := argument.expr.value
	words := [word |
		word := split(title, " ")[_]
		word != ""
	]
	count(words) > 1
	some index
	word := words[index]
	first := substring(word, 0, 1)
	first == lower(first)
	first != upper(first)
}

warnings contains {
	"rule_id": "apple.hig.menus.review_menu_title_capitalization",
	"message": "Review Menu title; multiword menu titles should use title-style capitalization.",
	"line": call.range.start,
	"column": 0,
	"severity": "warning",
} if {
	walk(input, [_, call])
	call._kind == "call_expr"
	call.fn._kind == "unresolved_decl_ref_expr"
	call.fn.name == "Menu"
	argument := call.args.args[_]
	argument.expr._kind == "string_literal_expr"
	title := argument.expr.value
	words := [word |
		word := split(title, " ")[_]
		word != ""
	]
	count(words) > 1
	some index
	word := words[index]
	first := substring(word, 0, 1)
	first == lower(first)
	first != upper(first)
}
