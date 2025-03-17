local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Add Go-specific snippet
ls.add_snippets("go", {
s("iferr", {
  t("if err != nil {"),
  t({"", "\t"}), -- Newline and tab
  i(1, "return err"), -- Placeholder for code inside the block
  t({"", "}"}), -- Newline and closing brace
  i(0), -- Final cursor position
}),
})

require("luasnip.loaders.from_vscode").lazy_load() -- Optional
