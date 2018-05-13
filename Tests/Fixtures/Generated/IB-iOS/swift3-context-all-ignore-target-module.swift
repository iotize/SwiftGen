// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import AVKit
import CustomSegue
import GLKit
import LocationPicker
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: Bundle(for: BundleToken.self))
  }
}

internal struct SceneType<T: Any> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal struct InitialSceneType<T: Any> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

internal protocol SegueType: RawRepresentable { }

internal extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum AdditionalImport: StoryboardType {
    internal static let storyboardName = "AdditionalImport"

    internal static let initialScene = InitialSceneType<LocationPicker.LocationPickerViewController>(storyboard: AdditionalImport.self)

    internal static let `public` = SceneType<SLKTextViewController>(storyboard: AdditionalImport.self, identifier: "public")
  }
  internal enum Anonymous: StoryboardType {
    internal static let storyboardName = "Anonymous"

    internal static let initialScene = InitialSceneType<UIKit.UINavigationController>(storyboard: Anonymous.self)
  }
  internal enum Dependency: StoryboardType {
    internal static let storyboardName = "Dependency"

    internal static let dependent = SceneType<UIKit.UIViewController>(storyboard: Dependency.self, identifier: "Dependent")
  }
  internal enum KnownTypes: StoryboardType {
    internal static let storyboardName = "Known Types"

    internal static let item1 = SceneType<GLKit.GLKViewController>(storyboard: KnownTypes.self, identifier: "item 1")

    internal static let item2 = SceneType<AVKit.AVPlayerViewController>(storyboard: KnownTypes.self, identifier: "item 2")

    internal static let item3 = SceneType<UIKit.UITabBarController>(storyboard: KnownTypes.self, identifier: "item 3")

    internal static let item4 = SceneType<UIKit.UINavigationController>(storyboard: KnownTypes.self, identifier: "item 4")

    internal static let item5 = SceneType<UIKit.UISplitViewController>(storyboard: KnownTypes.self, identifier: "item 5")

    internal static let item6 = SceneType<UIKit.UIPageViewController>(storyboard: KnownTypes.self, identifier: "item 6")

    internal static let item7 = SceneType<UIKit.UITableViewController>(storyboard: KnownTypes.self, identifier: "item 7")

    internal static let item8 = SceneType<UIKit.UICollectionViewController>(storyboard: KnownTypes.self, identifier: "item 8")

    internal static let item9 = SceneType<UIKit.UIViewController>(storyboard: KnownTypes.self, identifier: "item 9")
  }
  internal enum Message: StoryboardType {
    internal static let storyboardName = "Message"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: Message.self)

    internal static let composer = SceneType<UIKit.UIViewController>(storyboard: Message.self, identifier: "Composer")

    internal static let messagesList = SceneType<UIKit.UITableViewController>(storyboard: Message.self, identifier: "MessagesList")

    internal static let navCtrl = SceneType<UIKit.UINavigationController>(storyboard: Message.self, identifier: "NavCtrl")

    internal static let urlChooser = SceneType<XXPickerViewController>(storyboard: Message.self, identifier: "URLChooser")
  }
  internal enum Placeholder: StoryboardType {
    internal static let storyboardName = "Placeholder"

    internal static let navigation = SceneType<UIKit.UINavigationController>(storyboard: Placeholder.self, identifier: "Navigation")
  }
  internal enum Wizard: StoryboardType {
    internal static let storyboardName = "Wizard"

    internal static let initialScene = InitialSceneType<CreateAccViewController>(storyboard: Wizard.self)

    internal static let acceptToS = SceneType<UIKit.UIViewController>(storyboard: Wizard.self, identifier: "Accept-ToS")

    internal static let createAccount = SceneType<CreateAccViewController>(storyboard: Wizard.self, identifier: "CreateAccount")

    internal static let preferences = SceneType<UIKit.UITableViewController>(storyboard: Wizard.self, identifier: "Preferences")

    internal static let validatePassword = SceneType<UIKit.UIViewController>(storyboard: Wizard.self, identifier: "Validate_Password")
  }
}

internal extension CreateAccViewController {
  internal enum StoryboardSegue: String {
    case showPassword = "ShowPassword"
  }

  func perform(segue: StoryboardSegue, sender: Any? = nil) {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }

  internal enum TypedStoryboardSegue {
    case showPassword(destination: UIKit.UIViewController)
    case unnamedSegue

    // swiftlint:disable cyclomatic_complexity
    init(segue: UIStoryboardSegue) {
      switch segue.identifier ?? "" {
      case "ShowPassword":
        let vc = segue.destination
        self = .showPassword(destination: vc)
      case "":
        self = .unnamedSegue
      default:
        fatalError("Unrecognized segue '\(segue.identifier ?? "")' in CreateAccViewController")
      }
    }
    // swiftlint:enable cyclomatic_complexity
  }
}

internal extension XXPickerViewController {
  internal enum StoryboardSegue: String {
    case customBack = "CustomBack"
    case embed = "Embed"
    case nonCustom = "NonCustom"
    case showNavCtrl = "Show-NavCtrl"
  }

  func perform(segue: StoryboardSegue, sender: Any? = nil) {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }

  internal enum TypedStoryboardSegue {
    case customBack(destination: UIKit.UIViewController, segue: CustomSegueClass2)
    case embed(destination: UIKit.UIViewController)
    case nonCustom(destination: UIKit.UIViewController)
    case showNavCtrl(destination: UIKit.UINavigationController, segue: CustomSegueClass)
    case unnamedSegue

    // swiftlint:disable cyclomatic_complexity
    init(segue: UIStoryboardSegue) {
      switch segue.identifier ?? "" {
      case "CustomBack":
        guard let segue = segue as? CustomSegueClass2 else {
          fatalError("Segue 'CustomBack' is not of the expected type CustomSegueClass2.")
        }
        let vc = segue.destination
        self = .customBack(destination: vc, segue: segue)
      case "Embed":
        let vc = segue.destination
        self = .embed(destination: vc)
      case "NonCustom":
        let vc = segue.destination
        self = .nonCustom(destination: vc)
      case "Show-NavCtrl":
        guard let segue = segue as? CustomSegueClass else {
          fatalError("Segue 'Show-NavCtrl' is not of the expected type CustomSegueClass.")
        }
        guard let vc = segue.destination as? UIKit.UINavigationController else {
          fatalError("Destination of segue 'Show-NavCtrl' is not of the expected type UIKit.UINavigationController.")
        }
        self = .showNavCtrl(destination: vc, segue: segue)
      case "":
        self = .unnamedSegue
      default:
        fatalError("Unrecognized segue '\(segue.identifier ?? "")' in XXPickerViewController")
      }
    }
    // swiftlint:enable cyclomatic_complexity
  }
}

internal extension LocationPicker.LocationPickerViewController {
  internal enum StoryboardSegue: String {
    case `private`
  }

  func perform(segue: StoryboardSegue, sender: Any? = nil) {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }

  internal enum TypedStoryboardSegue {
    case `private`(destination: SLKTextViewController, segue: CustomSegue.SlideDownSegue)
    case unnamedSegue

    // swiftlint:disable cyclomatic_complexity
    init(segue: UIStoryboardSegue) {
      switch segue.identifier ?? "" {
      case "private":
        guard let segue = segue as? CustomSegue.SlideDownSegue else {
          fatalError("Segue 'private' is not of the expected type CustomSegue.SlideDownSegue.")
        }
        guard let vc = segue.destination as? SLKTextViewController else {
          fatalError("Destination of segue 'private' is not of the expected type SLKTextViewController.")
        }
        self = .`private`(destination: vc, segue: segue)
      case "":
        self = .unnamedSegue
      default:
        fatalError("Unrecognized segue '\(segue.identifier ?? "")' in LocationPicker.LocationPickerViewController")
      }
    }
    // swiftlint:enable cyclomatic_complexity
  }
}

internal extension SLKTextViewController {
  internal enum StoryboardSegue: String {
    case `private`
  }

  func perform(segue: StoryboardSegue, sender: Any? = nil) {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }

  internal enum TypedStoryboardSegue {
    case `private`(destination: SLKTextViewController, segue: CustomSegue.SlideDownSegue)
    case unnamedSegue

    // swiftlint:disable cyclomatic_complexity
    init(segue: UIStoryboardSegue) {
      switch segue.identifier ?? "" {
      case "private":
        guard let segue = segue as? CustomSegue.SlideDownSegue else {
          fatalError("Segue 'private' is not of the expected type CustomSegue.SlideDownSegue.")
        }
        guard let vc = segue.destination as? SLKTextViewController else {
          fatalError("Destination of segue 'private' is not of the expected type SLKTextViewController.")
        }
        self = .`private`(destination: vc, segue: segue)
      case "":
        self = .unnamedSegue
      default:
        fatalError("Unrecognized segue '\(segue.identifier ?? "")' in SLKTextViewController")
      }
    }
    // swiftlint:enable cyclomatic_complexity
  }
}

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
