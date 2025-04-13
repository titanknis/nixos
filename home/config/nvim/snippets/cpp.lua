local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
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
	s("no", t('cout <<"NO"<<endl;')),
	s("yesno", { t("cout <<(("), i(1, "condition"), t(')?"YES":"NO")<<endl;') }),

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

	-- 'template' snippet for competitve programming
	s("templ", t(load_template("~/.config/nvim/templates/template.cpp"))),
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
			"all    - Iterate over container (v.begin(), v.end())",
			"vi     - Vector of integers (vector<int>)",
			"vll    - Vector of long long integers (vector<long long>)",
			"ll     - 'long long' shorthand",
			"ull    - 'unsigned long long' shorthand",
			"pii    - Pair of integers (pair<int, int>)",
			"templ  - Template file for competitive programming",
			"dbg    - Debugging macros",
			"allinc - Include bits/stdc++.h and using namespace std;",
			"fio    - Fast I/O setup",
			"main   - Main function template",
			"limits - Display data type ranges",
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
