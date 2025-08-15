local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Function to insert the current line number
local function line_num()
	return tostring(vim.fn.line("."))
end

ls.add_snippets("python", {
	s("snips", {
		t("'''"),
		t({ "", "inp" }),
		t({ "", "io" }),
		t({ "", "ini" }),
		t({ "", "mint" }),
		t({ "", "li" }),
		t({ "", "main" }),
		t({ "", "gcdlcm" }),
		t({ "", "bsearch" }),
		t({ "", "'''", "" }),
	}),
	-- Fast input reading
	s("inp", {
		t("import sys"),
		t({ "", "input = sys.stdin.read" }),
		t({ "", "data = input().split()" }),
	}),

	-- Standard I/O
	s("io", {
		t("import sys"),
		t({ "", "input = sys.stdin.readline" }),
		t({ "", "print()" }),
	}),

	-- Fast integer input
	s("ini", {
		t("int(input())"),
	}),

	-- Read multiple integers
	s("mint", {
		t("map(int, input().split())"),
	}),

	-- List comprehension input
	s("li", {
		t("[int(x) for x in input().split()]"),
	}),

	-- GCD and LCM
	s("gcdlcm", {
		t({ "from math import gcd", "def lcm(a, b): return (a * b) // gcd(a, b)" }),
	}),

	-- Binary search template
	s("bsearch", {
		t({
			"def binary_search(arr, target):",
			"\tleft, right = 0, len(arr) - 1",
			"\twhile left <= right:",
			"\t\tmid = (left + right) // 2",
			"\t\tif arr[mid] == target:",
			"\t\t\treturn mid",
			"\t\telif arr[mid] < target:",
			"\t\t\tleft = mid + 1",
			"\t\telse:",
			"\t\t\tright = mid - 1",
			"\treturn -1",
		}),
	}),
})
