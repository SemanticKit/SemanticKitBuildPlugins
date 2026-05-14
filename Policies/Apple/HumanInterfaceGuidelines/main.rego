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

all_warnings := array.concat(
  safe_area_warnings,
  array.concat(
    fixed_font_size_warnings,
    array.concat(
      hardcoded_color_warnings,
      array.concat(
        symbol_accessibility_warnings,
        array.concat(button_label_warnings, array.concat(standard_navigation_label_warnings, apple_pay_button_warnings)),
      ),
    ),
  ),
)

safe_area_warnings := [warning |
  warning := data.apple.hig.layout.safe_area.decision.warn[_]
]

fixed_font_size_warnings := [warning |
  warning := data.apple.hig.accessibility.fixed_font_size.decision.warn[_]
]

hardcoded_color_warnings := [warning |
  warning := data.apple.hig.color.hardcoded_color.decision.warn[_]
]

symbol_accessibility_warnings := [warning |
  warning := data.apple.hig.accessibility.symbol_accessibility.decision.warn[_]
]

button_label_warnings := [warning |
  warning := data.apple.hig.components.button_labels.decision.warn[_]
]

standard_navigation_label_warnings := [warning |
  warning := data.apple.hig.components.standard_navigation_labels.decision.warn[_]
]

apple_pay_button_warnings := [warning |
  warning := data.apple.hig.platform_services.apple_pay_button.decision.warn[_]
]
