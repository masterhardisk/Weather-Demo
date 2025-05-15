//
//  CardinalPoint.swift
//  WeatherDemo
//
//  Created by MasterHardisk on 15/5/25.
//
import Foundation

enum CardinalPoint: String, CaseIterable {
    case N, E, S, W

    func position(in size: CGFloat) -> CGPoint {
        let offset: CGFloat = size / 2
        switch self {
        case .N:
            return CGPoint(x: offset, y: 0)
        case .E:
            return CGPoint(x: size, y: offset)
        case .S:
            return CGPoint(x: offset, y: size)
        case .W:
            return CGPoint(x: 0, y: offset)
        }
    }
    
    var localizedName: String {
            switch self {
            case .N: return String(localized: "cardinal_n")
            case .E: return String(localized: "cardinal_e")
            case .S: return String(localized: "cardinal_s")
            case .W: return String(localized: "cardinal_w")
            }
        }
}
