package apple.hig.menus.menu_title_capitalization

default decision := {"deny": [], "warn": [], "note": []}

decision := {
	"deny": [],
	"warn": warnings,
	"note": [],
}

warnings := [warning |
	group := warning_groups[_]
	warning := group[_]
]

warning_groups := [
	command_menu_title_capitalization_warning,
	menu_title_capitalization_warning,
]

command_menu_title_capitalization_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.menus.review_command_menu_title_capitalization", "Review CommandMenu title; multiword menu titles should use title-style capitalization.") if {
	call := data.apple.hig.swift_syntax.function_calls[_]
	command_menu_call(call)
	title := data.apple.hig.swift_syntax.string_literals(call)[_]
	multiword_title(title)
	has_non_title_style_word(title)
}

menu_title_capitalization_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.menus.review_menu_title_capitalization", "Review Menu title; multiword menu titles should use title-style capitalization.") if {
	call := data.apple.hig.swift_syntax.function_calls[_]
	menu_call(call)
	title := data.apple.hig.swift_syntax.string_literals(call)[_]
	multiword_title(title)
	has_non_title_style_word(title)
}

command_menu_call(call) if {
	data.apple.hig.swift_syntax.call_named(call, "CommandMenu")
}

command_menu_call(call) if {
	data.apple.hig.swift_syntax.call_named(call, "CommandMenu")
}

menu_call(call) if {
	data.apple.hig.swift_syntax.call_named(call, "Menu")
}

menu_call(call) if {
	data.apple.hig.swift_syntax.call_named(call, "Menu")
}

multiword_title(title) if {
	count(title_words(title)) > 1
}

has_non_title_style_word(title) if {
	words := title_words(title)
	some index
	word := words[index]
	not lowercase_minor_word_allowed(words, index)
	starts_with_lowercase_letter(word)
}

lowercase_minor_word_allowed(words, index) if {
	index > 0
	index < count(words) - 1
	lowercase_minor_words[lower(words[index])]
}

starts_with_lowercase_letter(word) if {
	first := substring(word, 0, 1)
	first == lower(first)
	first != upper(first)
}

title_words(title) := words if {
	words := [word |
		word := split(title, " ")[_]
		word != ""
	]
}

lowercase_minor_words := {
	"a",
	"an",
	"and",
	"as",
	"at",
	"but",
	"by",
	"for",
	"from",
	"in",
	"into",
	"nor",
	"of",
	"off",
	"on",
	"onto",
	"or",
	"out",
	"the",
	"to",
	"up",
	"via",
	"with",
}
