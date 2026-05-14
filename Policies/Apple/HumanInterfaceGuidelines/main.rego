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
  data.apple.hig.accessibility.accessibility_hidden.decision.warn,
  data.apple.hig.accessibility.fixed_font_size.decision.warn,
  data.apple.hig.accessibility.symbol_accessibility.decision.warn,
  data.apple.hig.augmented_reality.technical_ar_terms.decision.warn,
  data.apple.hig.color.hardcoded_color.decision.warn,
  data.apple.hig.components.button_labels.decision.warn,
  data.apple.hig.components.context_menu_availability.decision.warn,
  data.apple.hig.components.help_button.decision.warn,
  data.apple.hig.components.small_hit_region.decision.warn,
  data.apple.hig.components.standard_navigation_labels.decision.warn,
  data.apple.hig.content.image_tap_gesture.decision.warn,
  data.apple.hig.healthkit.healthkit_terms.decision.warn,
  data.apple.hig.identity.sign_in_with_apple_button.decision.warn,
  data.apple.hig.in_app_purchase.refund_labels.decision.warn,
  data.apple.hig.inputs.custom_keyboard_shortcuts.decision.warn,
  data.apple.hig.inputs.sensitive_secure_text_entry.decision.warn,
  data.apple.hig.layout.safe_area.decision.warn,
  data.apple.hig.menus.menu_title_capitalization.decision.warn,
  data.apple.hig.navigation.generic_search_placeholder.decision.warn,
  data.apple.hig.nfc.nfc_terms.decision.warn,
  data.apple.hig.patterns.progress_indicator.decision.warn,
  data.apple.hig.patterns.rating_prompt.decision.warn,
  data.apple.hig.patterns.share_button.decision.warn,
  data.apple.hig.patterns.tooltip_copy.decision.warn,
  data.apple.hig.patterns.undo_redo_controls.decision.warn,
  data.apple.hig.platform_services.airplay_custom_controls.decision.warn,
  data.apple.hig.platform_services.apple_pay_button.decision.warn,
  data.apple.hig.platform_services.game_center_terms.decision.warn,
  data.apple.hig.presentation.alert_ok_button.decision.warn,
  data.apple.hig.presentation.destructive_action_labels.decision.warn,
  data.apple.hig.presentation.open_window_action.decision.warn,
  data.apple.hig.presentation.scene_window_terminology.decision.warn,
  data.apple.hig.presentation.unhelpful_alert_title.decision.warn,
  data.apple.hig.presentation.window_sizing.decision.warn,
  data.apple.hig.sharing.shareplay_term.decision.warn,
  data.apple.hig.siri.hey_siri_phrase.decision.warn,
  data.apple.hig.siri.siri_pronouns.decision.warn,
  data.apple.hig.siri.voice_shortcut_terms.decision.warn,
  data.apple.hig.status.vague_progress_description.decision.warn,
  data.apple.hig.tables.column_heading_punctuation.decision.warn,
  data.apple.hig.tap_to_pay.tap_to_pay_button_label.decision.warn,
  data.apple.hig.typography.custom_font.decision.warn,
  data.apple.hig.typography.text_truncation.decision.warn,
  data.apple.hig.widgets.widget_description_copy.decision.warn,
  data.apple.hig.widgets.widget_margins.decision.warn,
  data.apple.hig.writing.click_here_label.decision.warn,
]
