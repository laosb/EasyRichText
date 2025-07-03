// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "EasyRichText",
  platforms: [
    .iOS(.v17),
    .macOS(.v14),
    .macCatalyst(.v17),
    .tvOS(.v17),
    .watchOS(.v10),
    .visionOS(.v1),
  ],
  products: [
    .library(
      name: "EasyRichText",
      targets: ["EasyRichText"]
    ),
    .library(
      name: "EasyRichTextUI",
      targets: ["EasyRichTextUI"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "EasyRichText",
      dependencies: []
    ),
    .target(
      name: "EasyRichTextUI",
      dependencies: ["EasyRichText"]
    ),
    .testTarget(
      name: "EasyRichTextTests",
      dependencies: ["EasyRichText"]
    ),
  ],
  swiftLanguageVersions: [.version("6"), .v5]
)
