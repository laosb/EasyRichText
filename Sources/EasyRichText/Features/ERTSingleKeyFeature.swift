//
//  ERTSingleKeyFeature.swift
//  RichTextTest
//
//  Created by Shibo Lyu on 2024/1/30.
//

import Foundation

public protocol ERTSingleKeyFeature: ERTFeature where Key.Value: Sendable {
  associatedtype Key: AttributedStringKey, Sendable
  associatedtype Value: Codable, Hashable, Equatable, Sendable

  init(attributeKeyValue: Key.Value?)
  init(value: Value?)

  func transformAttributedKeyValue(_ attributedKeyValue: Key.Value?) -> Key
    .Value?
}

extension ERTSingleKeyFeature {
  public init?(attributeContainer: AttributeContainer) {
    self.init(attributeKeyValue: attributeContainer[Key.self])
  }

  public func setupAttributes(on attributedString: AttributedString)
    -> AttributedString
  {
    var attributedString = attributedString
    let keyValue = attributedString[Key.self]
    attributedString[Key.self] = transformAttributedKeyValue(keyValue)
    return attributedString
  }
}
