//
//  ERTItalicFeature.swift
//  EasyRichText
//
//  Created by Shibo Lyu on 2024/1/30.
//

import Foundation

#if canImport(AppKit)
  import AppKit
#elseif canImport(UIKit)
  import UIKit
#endif

public struct ERTItalicFeature: ERTSymbolicTraitFeature {
  #if canImport(AppKit)
    public static let traits: NSFontDescriptor.SymbolicTraits = .italic
  #elseif canImport(UIKit)
    public static let traits: UIFontDescriptor.SymbolicTraits = .traitItalic
  #endif

  public var isOn: Bool

  public init(value: Bool?) {
    isOn = value ?? false
  }
}
