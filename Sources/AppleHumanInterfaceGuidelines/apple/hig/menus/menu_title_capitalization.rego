package apple.hig.menus.menu_title_capitalization

default decision := {"deny": [], "warn": [], "note": []}

# METADATA
# entrypoint: true
decision := {
	"deny": [],
	"warn": warnings,
	"note": [],
}

warnings := [warning |
	warning := menu_title_capitalization_warning[_]
]

menu_title_rules := {
	"CommandMenu": {
		"rule_id": "apple.hig.menus.review_command_menu_title_capitalization",
		"message": "Review CommandMenu title; multiword menu titles should use title-style capitalization.",
	},
	"Menu": {
		"rule_id": "apple.hig.menus.review_menu_title_capitalization",
		"message": "Review Menu title; multiword menu titles should use title-style capitalization.",
	},
}

menu_title_capitalization_warning contains {
	"rule_id": rule.rule_id,
	"message": rule.message,
	"line": call.range.start.line,
	"column": call.range.start.column,
	"severity": "warning",
} if {
	some call in input.functionCallExprs
	callee := call.calledExpression.declReferenceExpr
	rule := menu_title_rules[callee.baseName]
	some labeled_argument in call.arguments
	literal := labeled_argument.expression.stringLiteralExpr
	segment := literal.segments[_].stringSegment
	words := [word |
		word := split(segment.content, " ")[_]
		word != ""
	]
	count(words) > 1
	some index
	word := words[index]
	not lowercase_minor_word_allowed(words, index)
	first := substring(word, 0, 1)
	first == lower(first)
	first != upper(first)
}

lowercase_minor_word_allowed(words, index) if {
	index > 0
	index < count(words) - 1
	lowercase_minor_words[lower(words[index])]
}

lowercase_minor_words := {
	"a", "an", "and", "as", "at", "but", "by", "for", "from", "in", "into", "nor",
	"of", "off", "on", "onto", "or", "out", "the", "to", "up", "via", "with",
}
