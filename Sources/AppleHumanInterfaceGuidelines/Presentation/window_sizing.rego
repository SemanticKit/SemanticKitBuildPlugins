package apple.hig.presentation.window_sizing

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
	warning := window_sizing_warning[_]
]

window_sizing_warning contains data.swift.syntax.warning(call, "apple.hig.presentation.review_window_sizing_constraints", "Review explicit window sizing; confirm the initial size fits content and resizing keeps content usable.") if {
	call := data.swift.syntax.function_calls[_]
	window_sizing_call(call)
}

window_sizing_call_names := {"defaultSize", "windowResizability"}

window_sizing_call(call) if {
	data.swift.syntax.call_named_in(call, window_sizing_call_names)
}

window_sizing_call(call) if {
	data.swift.syntax.call_named_in(call, window_sizing_call_names)
}
