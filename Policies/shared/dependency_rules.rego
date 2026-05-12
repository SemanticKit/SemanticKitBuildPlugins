package semantickit.shared

insecure_dependency(url) if {
  startswith(url, "http://")
}

insecure_dependency(url) if {
  startswith(url, "git://")
}
