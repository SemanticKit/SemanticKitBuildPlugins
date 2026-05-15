package apple.hig.presentation.scene_window_terminology

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
	warning := scene_window_terminology_warning[_]
]

scene_window_terminology_warning contains data.swift.syntax.warning(call, "apple.hig.presentation.review_scene_term_in_visible_copy", "Review visible copy that says scene; use window when referring to app windows.") if {
	call := data.swift.syntax.function_calls[_]
	visible_scene_copy_call(call)
	has_scene_term(call)
}

scene_window_terminology_warning contains data.swift.syntax.warning(call, "apple.hig.presentation.review_scene_term_in_action_label", "Review action label that says scene; use window for commands that open or manage windows.") if {
	call := data.swift.syntax.function_calls[_]
	scene_action_label_call(call)
	has_scene_term(call)
}

visible_scene_copy_call_names := {
	"Text",
	"Label",
	"TextField",
	"SecureField",
	"Alert",
	"help",
	"navigationTitle",
	"accessibilityLabel",
	"accessibilityHint",
}

scene_action_label_call_names := {"Button", "Link", "Menu", "CommandMenu"}

visible_scene_copy_call(call) if {
	data.swift.syntax.call_named_in(call, visible_scene_copy_call_names)
}

visible_scene_copy_call(call) if {
	data.swift.syntax.call_named_in(call, visible_scene_copy_call_names)
}

scene_action_label_call(call) if {
	data.swift.syntax.call_named_in(call, scene_action_label_call_names)
}

scene_action_label_call(call) if {
	data.swift.syntax.call_named_in(call, scene_action_label_call_names)
}

has_scene_term(call) if {
	argument := data.swift.syntax.string_literals(call)[_]
	normalized := lower(argument)
	term := scene_terms[_]
	has_term_with_boundaries(normalized, term)
}

scene_terms := {"scene", "scenes"}

boundary_characters := {
	" ",
	".",
	",",
	":",
	";",
	"!",
	"?",
	"-",
	"(",
	")",
	"[",
	"]",
	"{",
	"}",
	"/",
	"\\",
	"'",
	"\"",
}

has_term_with_boundaries(text, term) if {
	parts := split(text, term)
	occurrence_count := count(parts) - 1
	some index
	before := parts[index]
	index < occurrence_count
	next_index := index + 1
	after := parts[next_index]
	boundary_before_term(before)
	boundary_after_term(after)
}

boundary_before_term(before) if {
	before == ""
}

boundary_before_term(before) if {
	boundary := boundary_characters[_]
	endswith(before, boundary)
}

boundary_after_term(after) if {
	after == ""
}

boundary_after_term(after) if {
	boundary := boundary_characters[_]
	startswith(after, boundary)
}
