//
//  ERTSegment.swift
//  EasyRichText
//
//  Created by Shibo Lyu on 2024/1/29.
//

import CoreText
import Foundation

public protocol ERTSegment: Codable, Hashable, Sendable {
  var text: String { get set }

  init(text: String, attributeContainer: AttributeContainer)
  func attributedString(defaultFont: CTFont) -> AttributedString
}

extension ERTSegment {
  public init(text: String) {
    self.init(text: text, attributeContainer: .init())
  }
}

public protocol ERTForegroundColorSegment: Codable, Hashable {
  associatedtype ForegroundColor: ERTColor

  var color: ERTForegroundColorFeature<ForegroundColor>? { get set }
}

public protocol ERTBackgroundColorSegment: Codable, Hashable {
  associatedtype BackgroundColor: ERTColor

  var backgroundColor: ERTBackgroundColorFeature<BackgroundColor>? { get set }
}
