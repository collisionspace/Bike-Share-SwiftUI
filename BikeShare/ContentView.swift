//
//  ContentView.swift
//  BikeShareSwiftUI
//
//  Created by Daniel Slone on 3/5/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

import SwiftUI
import Mapbox

class DraggedOffset: ObservableObject {
    @Published var offset: CGFloat
    
    init(offset: CGFloat) {
        self.offset = offset
    }
}
struct ContentView: View {
    enum CardPosition {
        case bottom
        case middle
        case up
    }
    @State var annotations: [MGLPointAnnotation] = []
    @State private var draggedOffset: CGFloat = CGFloat(-88)
    @State var cardPosition: CardPosition = .bottom
    @ObservedObject var dragged = DraggedOffset(offset: -88)
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                MapView(annotations: self.$annotations)
                    .centerCoordinate(.init(latitude: 37.791293, longitude: -122.396324))
                    .zoomLevel(16)
                    .edgesIgnoringSafeArea([.top, .bottom])
                VStack {
                    BikeShareCard()
                    .frame(width: geometry.size.width, height: geometry.size.height + 88)
                    .cornerRadius(16)
                    .overlay(
                        VStack {
                            Spacer().frame(width: geometry.size.width, height: 45).background(Color.red)
                            .gesture(DragGesture()
                                .onChanged { value in
                                    withAnimation {
                                        switch self.cardPosition {
                                        case .bottom:
                                            if value.translation.height < 0 && value.translation.height > -600 {
                                                self.draggedOffset = value.translation.height - 88
                                            }
                                        case .middle:
                                            if value.translation.height < 0 {
                                                self.draggedOffset = -((geometry.size.height / 2) - value.translation.height - 88)
                                                print("middle draggedOffset")
                                                print(self.draggedOffset)
                                            }
                                        case .up:
                                            if value.translation.height < 0 {
                                                self.draggedOffset = (geometry.size.height - 88) - value.translation.height
                                            }
                                        }
                                    }
                                }
                                .onEnded { value in
                                    // These animations are completed
                                    withAnimation(.spring()) {
                                        if value.translation.height < -125 && value.translation.height > -300 {
                                            self.draggedOffset = -geometry.size.height / 2
                                            self.cardPosition = .middle
                                        } else if value.translation.height < 0  {
                                            self.draggedOffset =  -geometry.size.height + 88
                                            self.cardPosition = .up
                                        } else if value.translation.height > 125 && value.translation.height < 300 {
                                            self.draggedOffset = -geometry.size.height / 2
                                            self.cardPosition = .middle
                                        } else {
                                            self.draggedOffset = -88
                                            self.cardPosition = .bottom
                                        }
                                    }
                                    }
                            )
                        }, alignment: .top)
                        .offset(y: geometry.size.height + self.draggedOffset)
                }
            }.edgesIgnoringSafeArea(.bottom)
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
