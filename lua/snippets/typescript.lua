local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
  -- React Functional Component
  s("rfc", {
    t({ "interface " }), i(1, "Component"), t({ "Props {", "" }),
    t({ "  " }), i(2, "// props"), t({ "", "}", "", "" }),
    t({ "export const " }), f(function(args) return args[1][1] end, {1}), t({ " = ({}: " }), f(function(args) return args[1][1] end, {1}), t({ "Props) => {", "" }),
    t({ "  return (", "" }),
    t({ "    <div>", "" }),
    t({ "      " }), i(0), t({ "", "" }),
    t({ "    </div>", "" }),
    t({ "  )", "" }),
    t({ "}" }),
  }),

  -- React Functional Component with children
  s("rfcc", {
    t({ "interface " }), i(1, "Component"), t({ "Props {", "" }),
    t({ "  children: React.ReactNode", "" }),
    t({ "  " }), i(2, "// props"), t({ "", "}", "", "" }),
    t({ "export const " }), f(function(args) return args[1][1] end, {1}), t({ " = ({ children }: " }), f(function(args) return args[1][1] end, {1}), t({ "Props) => {", "" }),
    t({ "  return (", "" }),
    t({ "    <div>", "" }),
    t({ "      {children}", "" }),
    t({ "    </div>", "" }),
    t({ "  )", "" }),
    t({ "}" }),
  }),

  -- TypeScript Interface
  s("int", {
    t({ "interface " }), i(1, "Name"), t({ " {", "" }),
    t({ "  " }), i(0), t({ "", "}" }),
  }),

  -- TypeScript Type
  s("type", {
    t({ "type " }), i(1, "Name"), t({ " = " }), i(0),
  }),

  -- useState Hook
  s("ust", {
    t({ "const [" }), i(1, "state"), t({ ", set" }),
    f(function(args)
      local name = args[1][1]
      return name:sub(1,1):upper() .. name:sub(2)
    end, {1}),
    t({ "] = useState" }), t({ "<" }), i(2, "type"), t({ ">(" }), i(3, "initialValue"), t({ ")" }),
  }),

  -- useEffect Hook
  s("uef", {
    t({ "useEffect(() => {", "" }),
    t({ "  " }), i(0), t({ "", "" }),
    t({ "}, [" }), i(1), t({ "])" }),
  }),

  -- useCallback Hook
  s("ucb", {
    t({ "const " }), i(1, "callback"), t({ " = useCallback(() => {", "" }),
    t({ "  " }), i(0), t({ "", "" }),
    t({ "}, [" }), i(2), t({ "])" }),
  }),

  -- useMemo Hook
  s("umm", {
    t({ "const " }), i(1, "memoized"), t({ " = useMemo(() => " }), i(2, "value"), t({ ", [" }), i(3), t({ "])" }),
  }),

  -- Props Interface
  s("props", {
    t({ "interface Props {", "" }),
    t({ "  " }), i(0), t({ "", "}" }),
  }),

  -- Async Function
  s("asf", {
    t({ "const " }), i(1, "functionName"), t({ " = async (" }), i(2), t({ "): Promise<" }), i(3, "void"), t({ "> => {", "" }),
    t({ "  " }), i(0), t({ "", "}" }),
  }),

  -- Try-Catch
  s("tryc", {
    t({ "try {", "" }),
    t({ "  " }), i(1), t({ "", "" }),
    t({ "} catch (error) {", "" }),
    t({ "  " }), i(0, "console.error(error)"), t({ "", "" }),
    t({ "}" }),
  }),

  -- Console.log
  s("cl", {
    t({ "console.log(" }), i(0), t({ ")" }),
  }),

  -- Arrow Function
  s("af", {
    t({ "(" }), i(1), t({ ") => " }), i(0),
  }),
}
