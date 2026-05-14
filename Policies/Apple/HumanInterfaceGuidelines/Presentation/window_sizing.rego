package apple.hig.presentation.window_sizing

default decision := {"deny": [], "warn": [], "note": []}

decision := {
	"deny": [],
	"warn": warnings,
	"note": [],
}

warnings := [warning |
	warning := window_sizing_warning[_]
]

window_sizing_warning contains data.apple.hig.swift_syntax.warning(call, "apple.hig.presentation.review_window_sizing_constraints", "Review explicit window sizing; confirm the initial size fits content and resizing keeps content usable.") if {
	call := data.apple.hig.swift_syntax.function_calls[_]
	window_sizing_call(call)
}

window_sizing_call_names := {"defaultSize", "windowResizability"}

window_sizing_call(call) if {
	data.apple.hig.swift_syntax.call_named_in(call, window_sizing_call_names)
}

window_sizing_call(call) if {
	data.apple.hig.swift_syntax.call_named_in(call, window_sizing_call_names)
}
