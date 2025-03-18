local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
	s("snips", {
		t("/*"),
		t({ "", "fio" }),
		t({ "", "main" }),
		t({ "", "notes" }),
		t({ "", "/*", "" }),
	}),

	-- Fast I/O snippet
	s("fio", {
		t({
			"",
			"ios::sync_with_stdio(false);",
			"cin.tie(nullptr);",
		}),
	}),

	-- Main function template
	s("main", {
		t({
			-- "#include <bits/stdc++.h>",
			"#include <iostream>",
			"using namespace std;",
			"",
			"int main() {",
			"    ios::sync_with_stdio(false);",
			"    cin.tie(nullptr);",
			"",
			"    int t; cin >> t;",
			"    while (t--) {",
			"        ",
			"    }",
			"",
			"    return 0;",
			"}",
		}),
	}),

	s("notes", {
		t("/*"),
		t({ "", "Try to solve in 30-45 minutes. Otherwise Move on and Resolve later" }),
		t({ "", "", "Review Solutions and Learn :" }),
		t({ "", "\tAfter Solving (or At least Attemepting), Always Read the Editorial or other people Solution" }),
		t({ "", "\tUnderstand the Optimal Approach!" }),
		t({ "", "", "Work on Problem-Specific Techniques" }),
		t({ "", "", "Set a Goal for the Next Few Days" }),
		t({ "", "\tExample: Solve 10–15 problems in the 1000-1200 difficulty range over the next 3 days." }),
		t({
			"3. Always Read Constraints First",
			"Check input size to determine the best algorithm.",
			"If N ≤ 10^5, use O(N log N) algorithms.",
			"If N ≤ 10^6, O(N) or better is ideal.",
			"If N > 10^9, you usually need O(log N) or O(1) solutions.",
		}),
		t({ "", "*/", "" }),
	}),
})
