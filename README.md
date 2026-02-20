## acender

acender is a parser that takes Wren-like code and emits Luajit code which then is executable. It is a transpiler, a source-to-source compiler.

## Wren-like

acender is a dialect of Wren. It supports the majority of the already existing Wren syntax, and extends it with some new language features that make a lot of sense given the target host is luajit. For example, you can simply define 'field x = 1' in a class definition instead of creating a setter/getter combo. This makes sense since the target luajit supports public variables inside tables, which are what hosts Class/Objects in the final output.

Some changes are made to make the implementation simpler, such as not supporting module namespaces, and only one class per source file.

## Differences from Wren

acender also differs from the rules of Wren in many ways. Here are the broad strokes, and then specifics later:

 * No module namespaces for classes. All classes exists in the same namespace.
 * No global namespaces for variables. All variable top-level in a source file are local to that source file, only Classes are global.
 * One class per source file only.
 * Classes are the only capitalized names allowed. You may not Capitalize a variable or method.
 * Different import syntax: import Color32 from "src/Color32", or all classes in a folder with: import * from "src/", or from the source file directory with the same name: 'import Color32'
 * No 'static' keyword. Define static methods on a class by the prefix character '@'. The method @register(thing) { } is a static method on the class and not the object.
 * A new keyword for public class field data: 'field'. You can define a public field member of the class as so: ' field x = 0'. It must be initialized. Public static fields are fine too: 'field @objCount = 0'
 * Unlike Wren you may derive classes from the base classes: Map, List, and so on.
 * Bool, Num, and String classes are discarded for a more lua like approach. Two implicit classes with static functions Math and String provide the lua style functionality instead.
 * Bool, Num, and String still exist as types. You can use the new Object.typeof() static function like so: 'if (Object.typeof(1.1) == Num) {}' in place of say 'if (1.1.type == Num)'.
 
## Implicit class: Math

See the lua documentation: [Lua 5.1 Math](https://www.lua.org/manual/5.1/manual.html#5.6)

## Implicit class: String

See the lua documentation: [Lua 5.1 String](https://www.lua.org/manual/5.1/manual.html#5.4) With the exception that String.dump() is not present, as we don't support dumping functions to strings.

## Future plans

Transpiling to other syntax: ekbruligi is acender but targeting Javascript as the output, ignire is acender but targetting c++.