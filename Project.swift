import ProjectDescription

let iOSTargetVersion = "13.0"

let applicationTarget = Target(
  name: "Application",
  destinations: [.iPhone],
  product: .app,
  bundleId: "com.github.Orbinews.Home",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Application/Sources/**"],
  resources: ["Application/Resources/**"]
)

let homeTarget = Target(
  name: "home",
  destinations: [.iPhone],
  product: .app,
  bundleId: "com.github.orbinews.home",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Home/Sources/**"]
)

let homeTestTarget = Target(
  name: "homeunittest",
  destinations: [.iPhone],
  product: .unitTests,
  bundleId: "com.github.orbinews.home",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Home/Tests/**"],
  dependencies: [
    .target(name: homeTarget.name)
  ]
)

let homeUITestTarget = Target(
  name: "homeUITest",
  destinations: [.iPhone],
  product: .uiTests,
  bundleId: "com.github.orbinews.home",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Home/Tests/**"],
  dependencies: [
    .target(name: homeTarget.name)
  ]
)

let project = Project(
  name: "Orbinews",
  organizationName: "com.github",
  targets: [
    applicationTarget
  ]
)
