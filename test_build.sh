output="../build/ios_integ"
product="build/ios_integ/Build/Products"

flutter clean

# Pass --simulator if building for the simulator.
flutter build ios integration_test/basic_test.dart --release

pushd ios
xcodebuild build-for-testing \
  -workspace Runner.xcworkspace \
  -scheme Runner \
  -xcconfig Flutter/Release.xcconfig \
  -configuration Release \
  -derivedDataPath \
  $output -sdk iphoneos
popd

xcodebuild test-without-building -xctestrun "build/ios_integ/Build/Products/Runner_iphoneos17.0-arm64.xctestrun" -destination id=<YOUR DEVICE ID>