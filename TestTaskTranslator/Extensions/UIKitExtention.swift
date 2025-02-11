//
//  UIKitExtention.swift
//  TestTaskTranslator
//
//  Created by MaxK on 07.02.2025.
//

import Foundation
import SwiftUI

enum Konkhmer: String {
    case regular = "KonkhmerSleokchher-Regular"
}

extension Font {
    static func customfont(_ font: Konkhmer, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

extension Color {
    
    static var primaryApp: Color {
        return Color(hex: "F2E5CE")
    }
    
    static var primaryText: Color {
        return Color(hex: "292D32")
    }
    
    static var unselected: Color {
        return Color(hex: "C6AFA8")
    }
    
    static var gray: Color {
        return Color(hex: "#545D67")
    }
    
    static var mainBG: Color {
        return Color(hex: "C9FFE0")
    }
    
    static var White: Color {
        return Color(hex: "F3F5F6")
    }
    
    static var catSelected: Color {
        return Color(hex: "D1E7FC")
    }
    
    static var dogSelected: Color {
        return Color(hex: "ECFBC7")
    }
    
    static var settingButton: Color {
        return Color(hex: "D6DCFF")
    }
    
    static var shadowColor: Color {
        return Color(hex: "373E7D")
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB(12 -bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
