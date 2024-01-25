import ProjectDescription

let iOSTargetVersion = "13.0"

let homeTarget = Target(
  name: "Home",
  destinations: [.iPhone],
  product: .framework,
  bundleId: "com.github.Orbinews.Home",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Home/Sources/**"],
  resources: ["Application/Resources/**"]
)

let homeTestTarget = Target(
  name: "HomeUnitTest",
  destinations: [.iPhone],
  product: .unitTests,
  bundleId: "com.github.Orbinews.HomeTest",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Home/UnitTests/**"],
  dependencies: [
    .target(name: homeTarget.name)
  ]
)

let homeUITestTarget = Target(
  name: "HomeUITest",
  destinations: [.iPhone],
  product: .uiTests,
  bundleId: "com.github.Orbinews.HomeUITest",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Home/UITests/**"],
  dependencies: [
    .target(name: homeTarget.name)
  ]
)

let applicationTarget = Target(
  name: "Application",
  destinations: [.iPhone],
  product: .app,
  bundleId: "com.github.Orbinews",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Application/Sources/**"],
  resources: ["Application/Resources/**"],
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
