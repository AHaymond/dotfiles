((ERROR) @injection.content
 (#lua-match? @injection.content "^<%=?|<%-?|-?%>")
 (#lua-match? @injection.content "a^") ; Always false
 (#set! injection.language "ruby"))
;((ERROR) @injection.content
; (#lua-match? @injection.content "<%.*%>")
; (#set! injection.language "ruby"))
