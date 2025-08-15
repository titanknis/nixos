local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = require("luasnip.extras").rep

-- Function to load template from files
local function load_template(file_path)
	local file = io.open(vim.fn.expand(file_path), "r")
	if not file then
		return {}
	end
	local content = file:read("*all")
	file:close()
	return vim.split(content, "\n", { plain = true })
end

ls.add_snippets("cpp", {

	-- fast and useful
	s("yes", t('cout <<"YES"<<endl;')),
	s("yesif", {
		t("if("),
		i(1, "condition"),
		t(")"),
		t('cout<<"YES"<<endl;'),
	}),

	s("no", t('cout<<"NO"<<endl;')),
	s("yesno", { t("cout<<(("), i(1, "condition"), t(')?"YES":"NO")<<endl;') }),

	s({ trig = "sum", dscr = "accumulate(v.begin(), v.end(), 0)" }, {
		t("accumulate("),
		i(1, "v"),
		t(".begin(), "),
		rep(1),
		t(".end()"),
		t(", 0)"),
	}),

	s({ trig = "count", dscr = "count(v.begin(), v.end(), x)" }, {
		t("count("),
		i(1, "v"),
		t(".begin(), "),
		rep(1),
		t(".end(), "),
		i(2, "x"),
		t(")"),
	}),

	s({ trig = "sort", dscr = "sort(v.begin(), v.end())" }, {
		t("sort("),
		i(1, "v"),
		t(".begin(), "),
		rep(1),
		t(".end())"),
	}),

	s({ trig = "cusort", dscr = "sort(v.begin(), v.end(), [](auto a, auto b){return Condition;})" }, {
		t("sort("),
		i(1, "v"),
		t(".begin(), "),
		rep(1),
		t(".end(), "),
		t("[](auto a, auto b){return "),
		i(2, "Condition"),
		t(";})"),
	}),

	s({ trig = "all", dscr = "v.begin(), v.end()" }, {
		i(1, "v"),
		t(".begin(), "),
		rep(1),
		t(".end()"),
	}),

	s("ll", t("long long")), -- 'll' expands to 'long long'
	s("ull", t("unsigned long long")), -- 'ull' expands to 'unsigned long long'
	s("vi", t("vector<int>")), -- 'vi' expands to 'vector<int>'
	s("vll", t("vector<long long>")), -- 'vi' expands to 'vector<int>'
	s("pii", t("pair<int, int>")), -- 'pii' expands to 'pair<int, int>'

	-- Combination function (O(k) with symmetry)
	s(
		"comb",
		t({
			"long long comb(int n, int k) {",
			"    if (k > n) return 0; ",
			"    if (k > n - k)",
			"        k = n - k;",
			"    long long res = 1;",
			"    for (int i = 1; i <= k; ++i)",
			"        res = res * (n - k + i) / i;",
			"    return res;",
			"}",
		})
	),
	-- Permutation function (O(k), no symmetry)
	s(
		"perm",
		t({
			"long long perm(int n, int k) {",
			"    if (k > n) return 0; ",
			"    long long res = 1;",
			"    for (int i = 0; i < k; ++i)",
			"        res *= (n - i);",
			"    return res;",
			"}",
		})
	),

	-- 'template' snippet for competitve programming
	s("templ", { t(load_template("~/.config/nvim/templates/template.cpp")) }, {
		-- Snippet options (third parameter)
		callbacks = {
			[0] = {
				[events.enter] = function()
					vim.schedule(function()
						vim.cmd("normal! gg")
						vim.cmd("/solve")
						vim.cmd("normal! o")
					end)
				end,
			},
		},
	}),
	s("dbg", {
		t({
			"#ifdef LOCAL",
			'#include "../../algo/debug.h"',
			"#else",
			"#define debug(...)",
			"#define debugln(...)",
			"#endif",
		}),
	}),
	s("snips", {
		t({
			"/*",
			"yesno  - Conditional 'YES' or 'NO' output",
			"yes    - Output 'YES' with cout",
			"no     - Output 'NO' with cout",
			"",
			"sum    - Sum all elements in a container using accumulate",
			"count  - Count occurrences of an element in a container",
			"sort   - Sort a container in ascending order",
			"cusort - Sort a container with a custom comparator (lambda)",
			"all    - Shorthand for v.begin(), v.end()",
			"",
			"vi     - Shortcut for vector<int>",
			"vll    - Shortcut for vector<long long>",
			"ll     - Shorthand for 'long long'",
			"ull    - Shorthand for 'unsigned long long'",
			"pii    - Pair of integers (pair<int, int>)",
			"",
			"comb   - Combinations function snippet",
			"perm   - Permutations function snippet",
			"",
			"templ  - Base template for competitive programming",
			"dbg    - Macros for debug printing",
			"allinc - Include all standard headers and 'using namespace std;'",
			"fio    - Fast cin/cout I/O setup",
			"iof    - File I/O template (e.g., for USACO)",
			"main   - Main function boilerplate",
			"limits - Print min/max values of standard types",
			"*/",
			"",
		}),
	}),
	s("allinc", {
		t({
			"#include <bits/stdc++.h>",
			"using namespace std;",
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
	-- USACO I/O file
	s("iof", {
		t('freopen("'),
		i(1, "problemname"),
		t('.in", "r", stdin);'),
		t({ "", "" }),
		t('freopen("'),
		rep(1),
		t('.out", "w", stdout);'),
	}),

	-- Main function template
	s("main", {
		t({
			"#include <bits/stdc++.h>",
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

	s("limits", {
		t({
			"// int:                ~±2×10⁹ (32-bit), Range: -2³¹ to 2³¹ - 1",
			"// long long:          ~±9×10¹⁸ (64-bit), Range: -2⁶³ to 2⁶³ - 1",
			"// unsigned int:       ~0 to 4.29×10⁹ (32-bit), Range: 0 to 2³² - 1",
			"// unsigned long long: ~0 to 1.84×10¹⁹ (64-bit), Range: 0 to 2⁶⁴ - 1",
			"// double:             Precision: ~15-16 digits, Range: ±1.7×10³⁰⁸",
			"// bool:               True/False (1 byte), Range: 0 or 1",
			"// char:               8-bit (1 byte), Range: -2⁷ to 2⁷ - 1",
		}),
	}),
})
