import Foundation
import ProjectDescription

let companyName = "Anonymous"
var defaultYear: String {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "yyyy"
  return dateFormatter.string(from: Date())
}

var defaultDate: String {
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "dd/MM/yyyy"
  return dateFormatter.string(from: Date())
}

let nameAttribute: Template.Attribute = .required("name")
let authorAttribute: Template.Attribute = .required("author")
let yearAttribute: Template.Attribute = .optional("year", default: defaultYear)
let dateAttribute: Template.Attribute = .optional("date", default: defaultDate)
let companyAttribute: Template.Attribute = .optional("company", default: companyName)

let projectPath = "."
let appPath = "Application/"

let template = Template(
  description: "Application template",
  attributes: [
    nameAttribute,
    authorAttribute,
    yearAttribute,
    dateAttribute,
    companyAttribute
  ],
  items: [
    .file(
      path: appPath + "/Sources/AppDelegate.swift",
      templatePath: "AppDelegate.stencil"
    ),

    .file(
      path: appPath + "/Sources/SceneDelegate.swift",
      templatePath: "SceneDelegate.stencil"
    ),

    .file(
      path: appPath + "/Resources/Info.plist",
      templatePath: "Info.plist.stencil"
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
