import ProjectDescription

let iOSTargetVersion = "13.0"

let applicationTarget = Target(
  name: "Application",
  destinations: [.iPhone],
  product: .app,
  bundleId: "com.github.Orbinews",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Application/Sources/**"],
  resources: ["Application/Resources/**"]
)

let homeTarget = Target(
  name: "home",
  destinations: [.iPhone],
  product: .framework,
  bundleId: "com.github.Orbinews.Home",
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Home/Sources/**"],
  resources: ["Application/Resources/**"]
)

let homeTestTarget = Target(
  name: "homeUnitTest",
  destinations: [.iPhone],
  product: .unitTests,
  bundleId: "com.github.Orbinews.HomeTest",
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Home/UnitTests/**"],
  dependencies: [
    .target(name: homeTarget.name)
  ]
)

let homeUITestTarget = Target(
  name: "homeUITest",
  destinations: [.iPhone],
  product: .uiTests,
  bundleId: "com.github.Orbinews.HomeUITest",
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Home/UITests/**"],
  dependencies: [
    .target(name: homeTarget.name)
  ]
)

let project = Project(
  name: "Orbinews",
  organizationName: "com.github",
  targets: [
    applicationTarget,
    homeTarget,
    homeTestTarget,
    homeUITestTarget
  ]
)
