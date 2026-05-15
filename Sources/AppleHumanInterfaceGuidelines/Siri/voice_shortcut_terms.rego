package apple.hig.siri.voice_shortcut_terms

# METADATA
# scope: document
# entrypoint: true
default decision := {"deny": [], "warn": [], "note": []}

decision := {
	"deny": [],
	"warn": warnings,
	"note": [],
}

warnings := [warning |
	warning := voice_shortcut_terms_warning[_]
]

voice_shortcut_terms_warning contains data.swift.syntax.warning(call, "apple.hig.siri.review_voice_shortcut_terms", "Review visible Siri shortcut terminology; avoid phrases such as Add Voice Shortcut, Make a Voice Command, or Create Voice Prompt.") if {
	call := data.swift.syntax.function_calls[_]
	visible_string_call(call)
	uses_discouraged_voice_shortcut_term(call)
}

visible_string_call_names := {"Text", "Label", "Button", "TextField", "help"}

visible_string_call(call) if {
	data.swift.syntax.call_named_in(call, visible_string_call_names)
}

visible_string_call(call) if {
	data.swift.syntax.call_named_in(call, visible_string_call_names)
}

discouraged_voice_shortcut_terms := {
	"add voice shortcut",
	"add voice shortcuts",
	"make a voice command",
	"create a voice prompt",
}

uses_discouraged_voice_shortcut_term(call) if {
	argument := data.swift.syntax.string_literals(call)[_]
	normalized_argument := lower(argument)
	discouraged_term := discouraged_voice_shortcut_terms[_]
	contains(normalized_argument, discouraged_term)
}
