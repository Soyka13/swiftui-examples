//
//  ContentView.swift
//  TinderCards
//
//  Created by Olena Stepaniuk on 21.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var dragState = DragState.inactive
    
    private var dragThreshold: CGFloat = 80.0
    
    @State var cardViews: [CardView] = {
        
        var views = [CardView]()
        
        for index in 0..<2 {
            views.append(CardView(image: trips[index].image, title: trips[index].destination))
        }
        
        return views
    }()
    
    @State private var lastIndex = 1
    
    @State private var removalTransiotion = AnyTransition.trailingBottom
    
    var body: some View {
        VStack {
            TopBarMenu()
            
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(content: {
                            ZStack {
                                Image(systemName: "x.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 100))
                                    .opacity(self.dragState.translation.width < -self.dragThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0)
                                
                                Image(systemName: "heart.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 100))
                                    .opacity(self.dragState.translation.width > self.dragThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0)
                            }
                        })
                        .offset(
                            x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0,
                            y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height: 0)
                        .scaleEffect(self.dragState.isDragging ? 0.95 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width / 10) : 0))
                        .animation(.interpolatingSpring(stiffness: 180, damping: 100), value: self.dragState.translation)
                        .transition(self.removalTransiotion)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { value, state, transaction in
                                    
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                        
                                    default: break
                                    }
                                })
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragThreshold {
                                        self.removalTransiotion = .leadingBottom
                                    }
                                    
                                    if drag.translation.width > self.dragThreshold {
                                        self.removalTransiotion = .trailingBottom
                                    }
                                })
                                .onEnded({ value in
                                    
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragThreshold ||
                                        drag.translation.width > self.dragThreshold {
                                        
                                        self.moveCard()
                                    }
                                })
                        )
                    
                }
            }
            
            Spacer(minLength: 20)
            
            BottomBarMenu()
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        }
    }
    
    private func isTopCard(cardView: CardView) -> Bool {
        
        guard let index = cardViews.firstIndex(where: {
            $0.id == cardView.id
        }) else {
            return false
        }
        
        return index == 0
    }
    
    private func moveCard() {
        cardViews.removeFirst()
        
        self.lastIndex += 1
        
        let trip = trips[lastIndex % trips.count]
        let newCardView = CardView(image: trip.image, title: trip.destination)
        
        cardViews.append(newCardView)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        TopBarMenu()
            .previewDisplayName("TopBarMenu")
        
        BottomBarMenu()
            .previewDisplayName("BottomBarMenu")
    }
}

