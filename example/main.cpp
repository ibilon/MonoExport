#include "MonoExport.hpp"

int main() {
	MonoExport::init("output/bin/output.dll");
	MonoExport::MyHaxeClass::sayHello("John");
	MonoExport::MyHaxeClass::sayHello("John");
	MonoExport::clean();
}
