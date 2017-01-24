package monoexport;

@:keep
class MonoExportUtils
{
	public static function toArrayString (a:cs.NativeArray<String>) return cs.Lib.array(a);
	public static function toArrayFloat (a:cs.NativeArray<Float>) return cs.Lib.array(a);
	public static function toArrayInt (a:cs.NativeArray<Int>) return cs.Lib.array(a);
	public static function toArrayBool (a:cs.NativeArray<Bool>) return cs.Lib.array(a);
	public static function fromArrayString (a:Array<String>) return cs.Lib.nativeArray(a, true);
	public static function fromArrayFloat (a:Array<Float>) return cs.Lib.nativeArray(a, true);
	public static function fromArrayInt (a:Array<Int>) return cs.Lib.nativeArray(a, true);
	public static function fromArrayBool (a:Array<Bool>) return cs.Lib.nativeArray(a, true);
}
