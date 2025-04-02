; Match the start of an ERB block (<% ...)
((ERROR) @erb_start
 (#match? @erb_start "<%.*")
 (#set! "highlight" "Comment"))

; Match the end of an ERB block (... %>)
((ERROR) @erb_end
 (#match? @erb_end ".*%>")
 (#set! "highlight" "Comment"))

