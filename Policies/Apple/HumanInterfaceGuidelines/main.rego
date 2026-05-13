package apple.hig.main

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := warning_item[_]
]

warning_item contains {
  "id": "apple.hig.privacy.permission_purpose_strings",
  "message": "Review permission purpose strings for brevity, specificity, active voice, sentence case, and terminal punctuation.",
  "artifact": plist,
  "severity": "warning",
  "source": "https://developer.apple.com/design/human-interface-guidelines/privacy",
} if {
  plist := input.artifactCatalog.propertyLists[_]
}
