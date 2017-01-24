@:monoExport
class MyHaxeClass {
	static var first:Bool = true;
	public static function sayHello(name:String) {
		trace("Hello" + (first ? " " : " again ") + name + "!");
		first = false;
	}
}
