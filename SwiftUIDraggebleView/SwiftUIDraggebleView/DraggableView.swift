//
//  DraggableView.swift
//  SwiftUIDraggebleView
//
//  Created by Olena Stepaniuk on 24.02.2023.
//

import SwiftUI

struct DraggableView<Content>: View where Content: View {
    
    @GestureState private var dragState = DragState.inactive
    @State private var position = CGSize.zero
    
    var content: () -> Content
    
    var body: some View {
        content()
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
            .animation(.easeInOut, value: dragState.translation)
            .foregroundColor(.green)
            .gesture(
                LongPressGesture(minimumDuration: 0.1)
                    .sequenced(before: DragGesture())
                    .updating($dragState, body: { value, state, transaction in
                        switch value {
                            
                        case .first(true):
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                            
                        default: break
                        }
                    })
                    .onEnded({ value in
                        
                        guard case .second(true, let drag?) = value else  {
                            return
                        }
                        
                        self.position.height += drag.translation.height
                        self.position.width += drag.translation.width
                    })
            )
    }
}
