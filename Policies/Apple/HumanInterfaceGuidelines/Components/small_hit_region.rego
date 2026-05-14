package apple.hig.components.small_hit_region

default decision := {"deny": [], "warn": [], "note": []}

decision := {
  "deny": [],
  "warn": warnings,
  "note": [],
}

warnings := [warning |
  warning := small_hit_region_warning[_]
]

small_hit_region_warning contains {
  "rule_id": "apple.hig.components.review_small_hit_region",
  "message": "Review explicit small frame dimensions; width or height below 44 pt may affect interactive hit regions.",
  "artifact": fact.artifact,
  "line": fact.line,
  "column": fact.column,
  "severity": "warning",
} if {
  fact := input.swiftSourceFacts.callFacts[_]
  frame_call(fact)
  has_argument_label(fact, "width")
  has_argument_label(fact, "height")
  has_small_numeric_argument(fact)
}

frame_call(fact) if {
  fact.baseName == "frame"
}

frame_call(fact) if {
  fact.memberName == "frame"
}

has_argument_label(fact, label) if {
  fact.argumentLabels[_] == label
}

has_small_numeric_argument(fact) if {
  dimension := to_number(fact.numericArguments[_])
  dimension < 44
}
