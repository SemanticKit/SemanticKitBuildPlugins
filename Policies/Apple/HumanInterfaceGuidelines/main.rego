package apple.hig.main

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := all_warnings[_]
]

all_warnings := array.concat(safe_area_warnings, array.concat(fixed_font_size_warnings, hardcoded_color_warnings))

safe_area_warnings := [warning |
  warning := data.apple.hig.layout.safe_area.decision.warn[_]
]

fixed_font_size_warnings := [warning |
  warning := data.apple.hig.accessibility.fixed_font_size.decision.warn[_]
]

hardcoded_color_warnings := [warning |
  warning := data.apple.hig.color.hardcoded_color.decision.warn[_]
]
