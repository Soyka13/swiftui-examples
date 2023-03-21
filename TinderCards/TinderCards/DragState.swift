//
//  DragState.swift
//  TinderCards
//
//  Created by Olena Stepaniuk on 21.03.2023.
//

import UIKit

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
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging, .pressing:
            return true
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .inactive:
           return false
        case .dragging, .pressing:
            return true
        }
    }
}
