//
// SwiftGen
// Copyright (c) 2015 Olivier Halligon
// MIT Licence
//

import StencilSwiftKit
import XCTest

class InterfaceBuilderiOSTests: XCTestCase {
  enum Contexts {
    static let all = ["empty", "all"]
  }

  // generate variations to test target module matching and custom enum names
  let variations: VariationGenerator = { name, context in
    guard name == "all" else { return [(context: context, suffix: "")] }

    return [
      (context: context,
       suffix: ""),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["sceneEnumName=XCTStoryboardsScene",
                                                       "segueEnumName=XCTStoryboardsSegue"]),
       suffix: "-customname"),
      (context: try StencilContext.enrich(context: context,
                                          parameters: [],
                                          environment: ["PRODUCT_MODULE_NAME": "Test"]),
       suffix: ""),
      (context: try StencilContext.enrich(context: context,
                                          parameters: [],
                                          environment: ["PRODUCT_MODULE_NAME": "CustomSegue"]),
       suffix: "-ignore-module"),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["module=Test"]),
       suffix: ""),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["module=CustomSegue"]),
       suffix: "-ignore-module"),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["ignoreTargetModule"],
                                          environment: ["PRODUCT_MODULE_NAME": "Test"]),
       suffix: ""),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["ignoreTargetModule"],
                                          environment: ["PRODUCT_MODULE_NAME": "SlackTextViewController"]),
       suffix: "-ignore-module-need-extra-definitions"),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["module=Test", "ignoreTargetModule"]),
       suffix: ""),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["module=SlackTextViewController", "ignoreTargetModule"]),
       suffix: "-ignore-module-need-extra-definitions"),
      (context: try StencilContext.enrich(context: context,
                                          parameters: ["publicAccess"]),
       suffix: "-publicAccess")
    ]
  }

  func testScenesSwift3() {
    test(template: "scenes-swift3",
         contextNames: Contexts.all,
         directory: .interfaceBuilder,
         resourceDirectory: .interfaceBuilderiOS,
         contextVariations: variations)
  }

  func testSeguesSwift3() {
    test(template: "segues-swift3",
         contextNames: Contexts.all,
         directory: .interfaceBuilder,
         resourceDirectory: .interfaceBuilderiOS,
         contextVariations: variations)
  }

  func testScenesSwift4() {
    test(template: "scenes-swift4",
         contextNames: Contexts.all,
         directory: .interfaceBuilder,
         resourceDirectory: .interfaceBuilderiOS,
         contextVariations: variations)
  }

  func testSeguesSwift4() {
    test(template: "segues-swift4",
         contextNames: Contexts.all,
         directory: .interfaceBuilder,
         resourceDirectory: .interfaceBuilderiOS,
         contextVariations: variations)
  }
}
