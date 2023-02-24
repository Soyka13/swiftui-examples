//
//  DragState.swift
//  SwiftUIDraggebleView
//
//  Created by Olena Stepaniuk on 24.02.2023.
//

import Foundation

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .inactive:
            return true
        case .pressing, .dragging:
            return false
        }
    }
}
