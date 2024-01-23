import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")
let projectPath = "."

let template = Template(
  description: "Application template",
  attributes: [
    nameAttribute
  ],
  files: [
    .file(
      path: projectPath + "/Project.swift",
      templatePath: "Project.stencil"
    ),

    .file(
      path: projectPath + "/Sources/AppDelegate.swift",
      templatePath: "AppDelegate.stencil"
    ),

    .file(
      path: projectPath + "/Sources/SceneDelegate.swift",
      templatePath: "SceneDelegate.stencil"
    ),

    .file(
      path: projectPath + "/Resources/Assets.xcassets/AppIcon.appiconset/Contents.json",
      templatePath: "Contents.json.stencil"
    ),

    .file(
      path: projectPath + "/Resources/LaunchScreen.storyboard",
      templatePath: "LaunchScreen.storyboard.stencil"
    )
  ]
)
