import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")
let projectPath = "."
let appPath = "Application/"

let template = Template(
  description: "Application template",
  attributes: [
    nameAttribute
  ],
  items: [
    .file(
      path: projectPath + "/Project.swift",
      templatePath: "Project.stencil"
    ),

    .file(
      path: appPath + "/Sources/AppDelegate.swift",
      templatePath: "AppDelegate.stencil"
    ),

    .file(
      path: appPath + "/Sources/SceneDelegate.swift",
      templatePath: "SceneDelegate.stencil"
    ),

    .file(
      path: appPath + "/Resources/Assets.xcassets/AppIcon.appiconset/Contents.json",
      templatePath: "Contents.json.stencil"
    ),

    .file(
      path: appPath + "/Resources/LaunchScreen.storyboard",
      templatePath: "LaunchScreen.storyboard.stencil"
    )
  ]
)
