# MonoExport

Generate code used to launch a haxe executable from a c++ application, using the [mono runtime](http://www.mono-project.com/docs/advanced/embedding/).

Annoted classes will have their static functions made available to c++.

The haxe "world" is not reset between calls, so you can store data in static variables,
see the example for more details.

## Install

You can do either `haxelib install monoexport` or `haxelib git monoexport https://github.com/ibilon/MonoExport.git`.

## Usage

### Haxe

Add `-lib monoexport` to you hxml, and annotate the classes that should be exported with `@:monoExport`.

You can configure the name of the generated c++ file with `-D monoexport-out=filename.hpp`.

The following types are supported in argument/return values:

* `Bool`
* `Int`
* `Float`
* `String`
* `Array<Bool>`
* `Array<Int>`
* `Array<Float>`
* `Array<String>`

### C++

You need to compile with the mono runtime, you can find the required flags on linux with `pkg-config --cflags --libs mono-2`.

You just need to include the generated c++ file,
init with `MonoExport::init("path/to/haxe/cs.dll");` (Note: the dll will be named `cs-Debug.dll` when doing a debug build)
and you can call haxe functions using the following syntax: `MonoExport::HaxeClassName::functionname();`.

Don't forget to clean the mono runtime at the end `MonoExport::clean();`. 

## Example

You can find this example in the `example/` folder.

```haxe
@:monoExport
class MyHaxeClass {
	static var first:Bool = true;
	public static function sayHello(name:String) {
		trace("Hello" + (first ? " " : " again ") + name + "!");
		first = false;
	}
}
```

Compile it with `haxe MyHaxeClass -lib monoexport -cs output`.

```c++
#include "MonoExport.hpp"

int main() {
	MonoExport::init("output/bin/output.dll");
	MonoExport::MyHaxeClass::sayHello("John");
	MonoExport::MyHaxeClass::sayHello("John");
	MonoExport::clean();
}
```

Compile it (on linux) with `g++ main.cpp $(pkg-config --cflags --libs mono-2) -o host`.

Running it, `./host`, will print:
```
MyHaxeClass.hx:5: Hello John!
MyHaxeClass.hx:5: Hello again John!
```

## License

The code is licensed under the [MIT license](https://github.com/ibilon/monoexport/blob/master/LICENSE.md).
