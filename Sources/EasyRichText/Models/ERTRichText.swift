//
//  ERTRichText.swift
//  RichTextTest
//
//  Created by Shibo Lyu on 2024/1/30.
//

import SwiftUI

#if canImport(AppKit)
  import AppKit
#elseif canImport(UIKit)
  import UIKit
#endif

public protocol ERTRichText: Codable, Hashable, Sendable {
  associatedtype Segment: ERTSegment

  var segments: [Segment] { get set }

  init()
  init(attributedString: AttributedString)

  func attributedString(defaultFont: CTFont) -> AttributedString
}

extension ERTRichText {
  public init(attributedString: AttributedString) {
    self.init()
    self.segments = attributedString.runs.map { run in
      let text = String(attributedString[run.range].characters)
      return .init(text: text, attributeContainer: run.attributes)
    }
  }

  public init(nsAttributedString: NSAttributedString) {
    let attributedString = ERTAttributedStringBridge.default.attributedString(
      for: nsAttributedString
    )

    self.init(attributedString: attributedString)
  }

  public init(string: String) {
    self.init()
    self.segments = [.init(text: string)]
  }

  public func attributedString(defaultFont: CTFont) -> AttributedString {
    segments.map { $0.attributedString(defaultFont: defaultFont) }.reduce(
      AttributedString(),
      +
    )
  }
  public func attributedString(defaultFont: Font) -> AttributedString {
    let ctFont = ERTFontUtils.default.ctFont(from: defaultFont)
    #if canImport(AppKit)
      let fallbackFont = NSFont.preferredFont(forTextStyle: .body)
    #elseif canImport(UIKit)
      let fallbackFont = UIFont.preferredFont(forTextStyle: .body)
    #endif
    return attributedString(defaultFont: ctFont ?? fallbackFont)
  }

  public func nsAttributedString(defaultFont: CTFont) -> NSAttributedString {
    ERTAttributedStringBridge.default.nsAttributedString(
      for: attributedString(defaultFont: defaultFont)
    )
  }

  public var plainText: String {
    segments.map { $0.text }.joined()
  }
}
