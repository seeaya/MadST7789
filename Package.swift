// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "MadST7789",
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "MadST7789",
			targets: ["MadST7789"]),
	],
	dependencies: [
		// Dependencies declare other packages that this package depends on.
		// .package(url: /* package url */, from: "1.0.0"),
		.package(url: "https://github.com/madmachineio/SwiftIO.git", .branch("master")),
		.package(url: "https://github.com/seeaya/MadDisplay.git", .branch("main"))
	],
	targets: [
		// Targets are the basic building blocks of a package. A target can define a module or a test suite.
		// Targets can depend on other targets in this package, and on products in packages this package depends on.
		.target(
			name: "MadST7789",
			dependencies: ["SwiftIO", "MadDisplay"]),
		.testTarget(
			name: "MadST7789Tests",
			dependencies: ["MadST7789"]),
	]
)
