// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import AVKit
import GLKit
import LocationPicker
import SlackTextViewController
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

internal protocol SegueType: RawRepresentable { }

internal extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardSegue {
  internal enum AdditionalImport: String, SegueType {
    case `private`
  }
  internal enum Message: String, SegueType {
    case customBack = "CustomBack"
    case embed = "Embed"
    case nonCustom = "NonCustom"
    case showNavCtrl = "Show-NavCtrl"
  }
  internal enum Wizard: String, SegueType {
    case showPassword = "ShowPassword"
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}
