-- Aurora - A vibrant theme based on github_dark_dimmed
-- Green strings, purple keywords, detailed syntax highlighting inspired by Tokyo Night

local M = {}

-- Color palette
M.colors = {
	-- Base (softer dark from github_dark_dimmed)
	bg = "#363b44",
	fg = "#e6edf3",
	comment = "#8b949e",

	-- Green strings (github green)
	string = "#8ef5ac",
	string_escape = "#8ef569",

	-- Purple keywords
	keyword = "#d2a8ff",
	keyword_alt = "#bc8cff",

	-- Functions (bright blue)
	func = "#79c0ff",
	func_builtin = "#58a6ff",

	-- Types (cyan/teal)
	type = "#56d4dd",
	type_builtin = "#39c5cf",

	-- Constants/numbers (orange)
	constant = "#ffa657",
	number = "#f0883e",
	boolean = "#ff9e64",

	-- Variables and parameters (yellow tones)
	variable = "#e2c541",
	parameter = "#ffcc66",
	property = "#79c0ff",

	-- Operators and punctuation
	operator = "#ff7b72",
	bracket = "#a8b1bb",
	delimiter = "#8b949e",

	-- Unused/faded
	unused = "#6e7681",

	-- Special
	tag = "#7ee787",
	attribute = "#79c0ff",
	namespace = "#d2a8ff",
	preproc = "#ff7b72",
	regex = "#56d364",
}

-- Generate highlight groups
M.groups = function(c)
	return {
		-- Editor background
		Normal = { fg = c.fg, bg = c.bg },
		NormalFloat = { fg = c.fg, bg = c.bg },
		NormalNC = { fg = c.fg, bg = c.bg },

		-- Syntax (vim built-in)
		String = { fg = c.string },
		Character = { fg = c.string },
		Number = { fg = c.number },
		Float = { fg = c.number },
		Boolean = { fg = c.boolean },
		Constant = { fg = c.constant },
		Identifier = { fg = c.variable },
		Function = { fg = c.func },
		Statement = { fg = c.keyword },
		Keyword = { fg = c.keyword },
		Conditional = { fg = c.keyword },
		Repeat = { fg = c.keyword },
		Exception = { fg = c.keyword },
		Operator = { fg = c.operator },
		PreProc = { fg = c.preproc },
		Include = { fg = c.keyword },
		Type = { fg = c.type },
		StorageClass = { fg = c.keyword_alt },
		Structure = { fg = c.type },
		Typedef = { fg = c.type },
		Special = { fg = c.constant },
		SpecialChar = { fg = c.string_escape },
		Delimiter = { fg = c.bracket },

		-- Treesitter: Variables
		["@variable"] = { fg = c.variable },
		["@variable.builtin"] = { fg = c.constant },
		["@variable.member"] = { fg = c.property },
		["@variable.parameter"] = { fg = c.parameter },

		-- Treesitter: Constants
		["@constant"] = { fg = c.constant },
		["@constant.builtin"] = { fg = c.constant },
		["@constant.macro"] = { fg = c.constant },

		-- Treesitter: Modules
		["@module"] = { fg = c.namespace },
		["@module.builtin"] = { fg = c.namespace },
		["@label"] = { fg = c.tag },

		-- Treesitter: Strings
		["@string"] = { fg = c.string },
		["@string.documentation"] = { fg = c.string },
		["@string.regexp"] = { fg = c.regex },
		["@string.escape"] = { fg = c.string_escape },
		["@string.special"] = { fg = c.string_escape },
		["@string.special.symbol"] = { fg = c.constant },
		["@string.special.url"] = { fg = c.func, style = "underline" },

		-- Treesitter: Characters
		["@character"] = { fg = c.string },
		["@character.special"] = { fg = c.string_escape },

		-- Treesitter: Numbers/Booleans
		["@boolean"] = { fg = c.boolean },
		["@number"] = { fg = c.number },
		["@number.float"] = { fg = c.number },

		-- Treesitter: Types
		["@type"] = { fg = c.type },
		["@type.builtin"] = { fg = c.type_builtin },
		["@type.definition"] = { fg = c.type },
		["@type.qualifier"] = { fg = c.keyword_alt },

		-- Treesitter: Attributes/Properties
		["@attribute"] = { fg = c.attribute },
		["@attribute.builtin"] = { fg = c.attribute },
		["@property"] = { fg = c.property },

		-- Treesitter: Functions
		["@function"] = { fg = c.func },
		["@function.builtin"] = { fg = c.func_builtin },
		["@function.call"] = { fg = c.func },
		["@function.macro"] = { fg = c.func_builtin },
		["@function.method"] = { fg = c.func },
		["@function.method.call"] = { fg = c.func },

		-- Treesitter: Constructors/Operators
		["@constructor"] = { fg = c.type },
		["@operator"] = { fg = c.operator },

		-- Treesitter: Keywords (all purple)
		["@keyword"] = { fg = c.keyword },
		["@keyword.coroutine"] = { fg = c.keyword },
		["@keyword.function"] = { fg = c.keyword },
		["@keyword.operator"] = { fg = c.keyword_alt },
		["@keyword.import"] = { fg = c.keyword },
		["@keyword.type"] = { fg = c.keyword },
		["@keyword.modifier"] = { fg = c.keyword_alt },
		["@keyword.repeat"] = { fg = c.keyword },
		["@keyword.return"] = { fg = c.keyword },
		["@keyword.debug"] = { fg = c.keyword },
		["@keyword.exception"] = { fg = c.keyword },
		["@keyword.conditional"] = { fg = c.keyword },
		["@keyword.conditional.ternary"] = { fg = c.operator },
		["@keyword.directive"] = { fg = c.preproc },
		["@keyword.directive.define"] = { fg = c.preproc },

		-- Treesitter: Punctuation
		["@punctuation.delimiter"] = { fg = c.delimiter },
		["@punctuation.bracket"] = { fg = c.bracket },
		["@punctuation.special"] = { fg = c.operator },

		-- Treesitter: Comments
		["@comment"] = { fg = c.comment, style = "italic" },
		["@comment.documentation"] = { fg = c.comment, style = "italic" },

		-- Treesitter: Tags (HTML/JSX)
		["@tag"] = { fg = c.tag },
		["@tag.builtin"] = { fg = c.tag },
		["@tag.attribute"] = { fg = c.attribute },
		["@tag.delimiter"] = { fg = c.bracket },

		-- LSP semantic tokens (types)
		["@lsp.type.class"] = { fg = c.type },
		["@lsp.type.decorator"] = { fg = c.attribute },
		["@lsp.type.enum"] = { fg = c.type },
		["@lsp.type.enumMember"] = { fg = c.constant },
		["@lsp.type.function"] = { fg = c.func },
		["@lsp.type.interface"] = { fg = c.type },
		["@lsp.type.keyword"] = { fg = c.keyword },
		["@lsp.type.macro"] = { fg = c.func_builtin },
		["@lsp.type.method"] = { fg = c.func },
		["@lsp.type.namespace"] = { fg = c.namespace },
		["@lsp.type.parameter"] = { fg = c.parameter },
		["@lsp.type.property"] = { fg = c.property },
		["@lsp.type.struct"] = { fg = c.type },
		["@lsp.type.type"] = { fg = c.type },
		["@lsp.type.typeParameter"] = { fg = c.type },
		["@lsp.type.variable"] = { fg = c.variable },

		-- LSP semantic modifiers (const, readonly, etc.)
		["@lsp.mod.readonly"] = { fg = c.constant },
		["@lsp.mod.defaultLibrary"] = { fg = c.func_builtin },
		["@lsp.mod.deprecated"] = { strikethrough = true },

		-- LSP type+modifier combinations
		["@lsp.typemod.variable.readonly"] = { fg = c.constant },
		["@lsp.typemod.variable.defaultLibrary"] = { fg = c.func_builtin },
		["@lsp.typemod.property.readonly"] = { fg = c.constant },
		["@lsp.typemod.class.defaultLibrary"] = { fg = c.type_builtin },

		-- Diagnostics (unused imports/variables appear faded)
		DiagnosticUnnecessary = { fg = c.unused },
		DiagnosticDeprecated = { strikethrough = true, fg = c.unused },

		-- Make brackets more visible
		MatchParen = { fg = c.constant, bold = true },
	}
end

-- Setup options for github-theme
M.setup = {
	options = {
		styles = {
			comments = "italic",
			keywords = "NONE",
			functions = "NONE",
			variables = "NONE",
		},
	},
	groups = {
		all = M.groups(M.colors),
	},
}

return M
