package apple.hig.siri.voice_shortcut_terms

default decision := {"deny": [], "warn": [], "note": []}

decision := {
	"deny": [],
	"warn": warnings,
	"note": [],
}

warnings := [warning |
	warning := voice_shortcut_terms_warning[_]
]

voice_shortcut_terms_warning contains {
	"rule_id": "apple.hig.siri.review_voice_shortcut_terms",
	"message": "Review visible Siri shortcut terminology; avoid phrases such as Add Voice Shortcut, Make a Voice Command, or Create Voice Prompt.",
	"artifact": fact.artifact,
	"line": fact.line,
	"column": fact.column,
	"severity": "warning",
} if {
	fact := input.swiftSourceFacts.callFacts[_]
	visible_string_call(fact)
	uses_discouraged_voice_shortcut_term(fact)
}

visible_string_call_names := {"Text", "Label", "Button", "TextField", "help"}

visible_string_call(fact) if {
	visible_string_call_names[fact.baseName]
}

visible_string_call(fact) if {
	visible_string_call_names[fact.memberName]
}

discouraged_voice_shortcut_terms := {
	"add voice shortcut",
	"add voice shortcuts",
	"make a voice command",
	"create a voice prompt",
}

uses_discouraged_voice_shortcut_term(fact) if {
	argument := fact.stringArguments[_]
	normalized_argument := lower(argument)
	discouraged_term := discouraged_voice_shortcut_terms[_]
	contains(normalized_argument, discouraged_term)
}
