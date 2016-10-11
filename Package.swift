import PackageDescription

let package = Package(
    name: "StencilViewEngine",
    dependencies: [
        .Package(url: "https://github.com/noppoMan/Suv.git", majorVersion: 0, minor: 14),
        .Package(url: "https://github.com/slimane-swift/HTTPCore.git", majorVersion: 0, minor: 1),
        .Package(url: "https://github.com/kylef/Stencil.git", majorVersion: 0, minor: 6)
    ]
)
