//
//  Sendability Assumptions.swift
//  EasyRichText
//
//  Created by Shibo Lyu on 2025/7/3.
//

import CoreText
#if canImport(AppKit)
import AppKit
#elseif canImport(UIKit)
import UIKit
#endif

// Apple's old Cocoa Text Architecture Guide seem to imply sensibility of CTFont objects.
// https://developer.apple.com/library/archive/documentation/TextFonts/Conceptual/CocoaTextArchitecture/FontHandling/FontHandling.html#:~:text=Font%20objects%20are%20immutable%2C%20so%20it%20is%20safe%20to%20use%20them%20from%20multiple%20threads%20in%20your%20app.
extension CTFont: @unchecked @retroactive Sendable {}
#if canImport(AppKit)
extension NSFont: @unchecked @retroactive Sendable {}
#elseif canImport(UIKit)
extension UIFont: @unchecked @retroactive Sendable {}
#endif
