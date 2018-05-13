//
// SwiftGenKit
// Copyright (c) 2017 SwiftGen
// MIT Licence
//

import Foundation
import Kanna
import PathKit

public enum InterfaceBuilder {
  public enum ParserError: Error, CustomStringConvertible {
    case invalidFile(path: Path, reason: String)
    case unsupportedTargetRuntime(target: String)

    public var description: String {
      switch self {
      case .invalidFile(let path, let reason):
        return "error: Unable to parse file at \(path). \(reason)"
      case .unsupportedTargetRuntime(let target):
        return "Unsupported target runtime `\(target)`."
      }
    }
  }

  public final class Parser: SwiftGenKit.Parser {
    var storyboards = [Storyboard]()
    public var warningHandler: Parser.MessageHandler?

    public init(options: [String: Any] = [:], warningHandler: Parser.MessageHandler? = nil) {
      self.warningHandler = warningHandler
    }

    public func parse(path: Path) throws {
      if path.extension == "storyboard" {
        try addStoryboard(at: path)
      } else {
        let dirChildren = path.iterateChildren(options: [.skipsHiddenFiles, .skipsPackageDescendants])

        for file in dirChildren where file.extension == "storyboard" {
          try addStoryboard(at: file)
        }
      }
    }

    func addStoryboard(at path: Path) throws {
      do {
        let document = try Kanna.XML(xml: path.read(), encoding: .utf8)

        let name = path.lastComponentWithoutExtension
        let storyboard = try Storyboard(with: document, name: name)
        storyboards += [storyboard]
      } catch let error {
        throw ParserError.invalidFile(path: path, reason: "XML parser error: \(error).")
      }
    }

    var modules: Set<String> {
      return Set<String>(storyboards.flatMap { $0.modules })
    }

    var platform: String? {
      let platforms = Set<String>(storyboards.map { $0.platform.name })

      if platforms.count > 1 {
        return nil
      } else {
        return platforms.first
      }
    }

    func destination(for sceneID: String, in storyboard: Storyboard) -> Scene? {
      // directly to a scene
      if let scene = storyboard.scenes.first(where: { $0.sceneID == sceneID }) {
        return scene
      }

      // to a scene placeholder
      if let placeholder = storyboard.placeholders.first(where: { $0.sceneID == sceneID }),
        let storyboard = storyboards.first(where: { $0.name == placeholder.storyboardName }) {

        // can be either a scene by identifier, or the initial scene
        if let referencedIdentifier = placeholder.referencedIdentifier,
          let scene = storyboard.scenes.first(where: { $0.identifier == referencedIdentifier }) {
          return scene
        } else if placeholder.referencedIdentifier == nil {
          return storyboard.initialScene
        }
      }

      return nil
    }
  }
}
