package apple.hig.main

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
  data.apple.hig.accessibility.fixed_font_size.decision.warn,
  data.apple.hig.accessibility.symbol_accessibility.decision.warn,
  data.apple.hig.color.hardcoded_color.decision.warn,
  data.apple.hig.components.button_labels.decision.warn,
  data.apple.hig.components.standard_navigation_labels.decision.warn,
  data.apple.hig.identity.sign_in_with_apple_button.decision.warn,
  data.apple.hig.inputs.custom_keyboard_shortcuts.decision.warn,
  data.apple.hig.layout.safe_area.decision.warn,
  data.apple.hig.patterns.share_button.decision.warn,
  data.apple.hig.platform_services.airplay_custom_controls.decision.warn,
  data.apple.hig.platform_services.apple_pay_button.decision.warn,
]
