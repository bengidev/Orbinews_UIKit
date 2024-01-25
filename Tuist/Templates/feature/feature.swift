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

let featurePath = "Features/"

let template = Template(
  description: "Feature template",
  attributes: [
    nameAttribute,
    authorAttribute,
    yearAttribute,
    dateAttribute,
    companyAttribute
  ],
  items: [
    .file(
      path: featurePath + "\(nameAttribute)/Sources/\(nameAttribute)ViewController.swift",
      templatePath: "ViewController.stencil"
    ),

    .file(
      path: featurePath + "\(nameAttribute)/Sources/\(nameAttribute)View.swift",
      templatePath: "View.stencil"
    ),

    .file(
      path: featurePath + "\(nameAttribute)/Sources/\(nameAttribute)ViewModel.swift",
      templatePath: "ViewModel.stencil"
    ),

    .file(
      path: featurePath + "\(nameAttribute)/Sources/\(nameAttribute)Model.swift",
      templatePath: "Model.stencil"
    ),

    .file(
      path: featurePath + "\(nameAttribute)/UnitTests/\(nameAttribute)UnitTest.swift",
      templatePath: "UnitTest.stencil"
    ),

    .file(
      path: featurePath + "\(nameAttribute)/UITests/\(nameAttribute)UITest.swift",
      templatePath: "UITest.stencil"
    )
  ]
)
