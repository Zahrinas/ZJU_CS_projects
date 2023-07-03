
# Compiling

1. Debug

	```
	cd <work-directory>
	<cmake-directory>\cmake <source-directory>\demo\Bus\code -G "Visual Studio 17 2022" -A x64
	MSBuild ALL_BUILD.vcxproj /t:build /p:Configuration=Debug
	<cmake-directory>\ctest -C "Debug"
	```

1. Release

	```
	cd <work-directory>
	<cmake-directory>\cmake <source-directory>\demo\Bus\code -G "Visual Studio 17 2022" -A x64
	MSBuild ALL_BUILD.vcxproj /t:build /p:Configuration=Release
	<cmake-directory>\cpack -D CPACK_GENERATOR="ZIP"
	```
