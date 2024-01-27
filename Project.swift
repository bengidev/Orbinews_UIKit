import ProjectDescription

let iOSTargetVersion = "13.0"

let onboardingTarget = Target(
  name: "Onboarding",
  destinations: [.iPhone],
  product: .framework,
  bundleId: "com.github.Orbinews.Onboarding",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Onboarding/Sources/**"],
  resources: ["Application/Resources/**"]
)

let onboardingUnitTestTarget = Target(
  name: "OnboardingUnitTest",
  destinations: [.iPhone],
  product: .unitTests,
  bundleId: "com.github.Orbinews.OnboardingTest",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Onboarding/UnitTests/**"],
  dependencies: [
    .target(name: onboardingTarget.name)
  ]
)

let onboardingUITestTarget = Target(
  name: "OnboardingUITest",
  destinations: [.iPhone],
  product: .uiTests,
  bundleId: "com.github.Orbinews.OnboardingUITest",
  deploymentTargets: .iOS(iOSTargetVersion),
  infoPlist: .file(path: .init("Info.plist")),
  sources: ["Features/Onboarding/UITests/**"],
  dependencies: [
    .target(name: onboardingTarget.name)
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
    .target(name: onboardingTarget.name),
    .package(product: "Inject")
  ]
)

let project = Project(
  name: "Orbinews",
  organizationName: "com.github",
  options: .options(
    automaticSchemesOptions: .enabled(
      targetSchemesGrouping: .notGrouped,
      codeCoverageEnabled: true,
      testingOptions: [],
      testScreenCaptureFormat: .screenshots
    )
  ),
  packages: [
    .package(url: "https://github.com/krzysztofzablocki/Inject.git", .upToNextMajor(from: "1.2.4"))
  ],
  targets: [
    applicationTarget,
    onboardingTarget,
    onboardingUnitTestTarget,
    onboardingUITestTarget
  ]
)
