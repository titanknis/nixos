local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
	s("snips", {
		t("/*"),
		t({ "", "fio" }),
		t({ "", "allinc" }),
		t({ "", "limits" }),
		t({ "", "main" }),
		t({ "", "notes" }),
		t({ "", "/*", "" }),
	}),
	s("allinc", {
		t({
			"#include <bits/stdc++.h>",
			"using namespace std;",
		}),
	}),

	s("limits", {
		t({
			"// int:       ~10⁹ (32-bit)",
			"// long long: ~10¹⁸ (64-bit)",
			"// unsigned int: 0 to ~4.29 × 10⁹ (32-bit)",
			"// unsigned long long: 0 to ~1.84 × 10³⁹ (64-bit)",
			"// double:    Precision: ~15-16 digits, Range: ±1.7 × 10³⁰⁸",
		}),
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
