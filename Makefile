BUILD_TYPE=Release

macos:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=MAC_UNIVERSAL -S . -B build/macos
	cmake --build build/macos
	mkdir -p runtimes/macos
	cp build/macos/llama.cpp/libllama.a runtimes/macos/libllama.a

ios:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=OS -S . -B build/ios
	cmake --build build/ios
	mkdir -p runtimes/ios
	cp build/ios/llama.cpp/libllama.a runtimes/ios/libllama.a

ios_64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=OS64 -S . -B build/ios_64
	cmake --build build/ios_64
	mkdir -p runtimes/ios_64
	cp build/ios_64/llama.cpp/libllama.a runtimes/ios_64/libllama.a

maccatalyst_x64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=MAC_CATALYST -S . -B build/maccatalyst_x64
	cmake --build build/maccatalyst_x64
	mkdir -p runtimes/maccatalyst_x64
	cp build/maccatalyst_x64/llama.cpp/libllama.a runtimes/maccatalyst_x64/libllama.a

maccatalyst_arm64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=MAC_CATALYST_ARM64 -S . -B build/maccatalyst_arm64
	cmake --build build/maccatalyst_arm64
	mkdir -p runtimes/maccatalyst_arm64
	cp build/maccatalyst_arm64/llama.cpp/libllama.a runtimes/maccatalyst_arm64/libllama.a

ios_simulator_x64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATOR64 -S . -B build/ios_simulator_x64
	cmake --build build/ios_simulator_x64
	mkdir -p runtimes/ios_simulator_x64
	cp build/ios_simulator_x64/llama.cpp/libllama.a runtimes/ios_simulator_x64/libllama.a

ios_simulator_arm64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATORARM64 -S . -B build/ios_simulator_arm64
	cmake --build build/ios_simulator_arm64
	mkdir -p runtimes/ios_simulator_arm64
	cp build/ios_simulator_arm64/llama.cpp/libllama.a runtimes/ios_simulator_arm64/libllama.a

tvos_simulator_x64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATOR_TVOS -S . -B build/tvos_simulator_x64
	cmake --build build/tvos_simulator_x64
	mkdir -p runtimes/tvos_simulator_x64
	cp build/tvos_simulator_x64/llama.cpp/libllama.a runtimes/tvos_simulator_x64/libllama.a

tvos_simulator_arm64:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=SIMULATOR_TVOSARM64 -S . -B build/tvos_simulator_arm64
	cmake --build build/tvos_simulator_arm64
	mkdir -p runtimes/tvos_simulator_arm64
	cp build/tvos_simulator_arm64/llama.cpp/libllama.a runtimes/tvos_simulator_arm64/libllama.a

tvos:
	cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake -DPLATFORM=TVOS -S . -B build/tvos
	cmake --build build/tvos
	mkdir -p runtimes/tvos
	cp build/tvos/llama.cpp/libllama.a runtimes/tvos/libllama.a

lipo:
	mkdir -p lib/tvos-simulator
	lipo -create runtimes/tvos_simulator_arm64/libllama.a -create runtimes/tvos_simulator_x64/libllama.a -output lib/tvos-simulator/libllama.a
	mkdir -p lib/ios-simulator
	lipo -create runtimes/ios_simulator_arm64/libllama.a -create runtimes/ios_simulator_x64/libllama.a -output lib/ios-simulator/libllama.a
	mkdir -p lib/ios-device
	cp runtimes/ios/libllama.a lib/ios-device/libllama.a
	mkdir -p lib/maccatalyst
	lipo -create runtimes/maccatalyst_x64/libllama.a -create runtimes/maccatalyst_arm64/libllama.a -output lib/maccatalyst/libllama.a
	mkdir -p lib/tvos-device
	cp runtimes/tvos/libllama.a lib/tvos-device/libllama.a
	mkdir -p lib/macos
	cp runtimes/macos/libllama.a lib/macos/libllama.a

# android_arm64-v8a:
# 	cmake -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_SYSTEM_NAME=Android -DCMAKE_ANDROID_API=21 -DCMAKE_ANDROID_NDK=/Users/drasticactions/Library/Developer/Xamarin/android-sdk-macosx/ndk-bundle -S . -B build/android-arm64-v8a
# 	cmake --build build/android-arm64-v8a
# 	mkdir -p runtimes/android-arm64-v8a
# 	cp build/android-arm64-v8a/llama.cpp/libllama.so runtimes/android-arm64-v8a/libllama.so

# android_x86:
# 	cmake -DCMAKE_ANDROID_ARCH_ABI=x86 -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_SYSTEM_NAME=Android -DCMAKE_ANDROID_API=21 -DCMAKE_ANDROID_NDK=/Users/drasticactions/Library/Developer/Xamarin/android-sdk-macosx/ndk-bundle -S . -B build/android-x86
# 	cmake --build build/android-x86
# 	mkdir -p runtimes/android-x86
# 	cp build/android-x86/llama.cpp/libllama.so runtimes/android-x86/libllama.so

# android_x86_64:
# 	cmake -DCMAKE_ANDROID_ARCH_ABI=x86_64 -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCMAKE_SYSTEM_NAME=Android -DCMAKE_ANDROID_API=21 -DCMAKE_ANDROID_NDK=/Users/drasticactions/Library/Developer/Xamarin/android-sdk-macosx/ndk-bundle -S . -B build/android-x86_64
# 	cmake --build build/android-x86_64
# 	mkdir -p runtimes/android-x86_64
# 	cp build/android-x86_64/llama.cpp/libllama.so runtimes/android-x86_64/libllama.so

xcframework:
	mkdir -p output/lib
	xcrun xcodebuild -create-xcframework -library lib/ios-device/libllama.a -library lib/ios-simulator/libllama.a -library lib/tvos-device/libllama.a -library lib/tvos-simulator/libllama.a -library lib/macos/libllama.a -library lib/maccatalyst/libllama.a -output output/lib/llama.xcframework