local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

return {
  s(
    "rscp",
    fmt(
      [[
      interface Props {{
        children?: React.ReactNode;
      }}

      const {} = ({{ children }}: Props) => {{
        return <div>{{children}}</div>;
      }};

      export default {};
      ]],
      {
        i(1, "ComponentName"),
        rep(1),
      }
    )
  ),
  s(
    "rsc",
    fmt(
      [[
      const {} = () => {{
        return <div>{}</div>;
      }};

      export default {};
      ]],
      {
        i(1, "ComponentName"),
        rep(1),
        rep(1),
      }
    )
  ),
  s(
    "rnsafe",
    fmt(
      [[
      import {{ StyleSheet, Text }} from "react-native";
      import {{ SafeAreaView }} from "react-native-safe-area-context";

      const {} = () => {{
        return <SafeAreaView style={{styles.container}}>
          <Text>{}</Text>
        </SafeAreaView>
      }};

      const styles = StyleSheet.create({{
        container: {{
          flex: 1,
          justifyContent: "center",
          alignItems: "center",
          backgroundColor: "#fff"
        }}
      }})

      export default {};
      ]],
      {
        i(1, "ComponentName"),
        rep(1),
        rep(1),
      }
    )
  ),
  s(
    "rnft",
    fmt(
      [[
      import {{ Text, View }} from "react-native";

      const {} = () => {{
        return (
          <View className="flex-1 bg-white justify-center items-center">
            <Text>{}</Text>
          </View>
        );
      }};

      export default {};
      ]],
      {
        i(1, "ComponentName"),
        rep(1),
        rep(1),
      }
    )
  ),
}
