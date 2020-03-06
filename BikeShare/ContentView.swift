//
//  ContentView.swift
//  BikeShareSwiftUI
//
//  Created by Daniel Slone on 3/5/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

import SwiftUI
import Mapbox

struct ContentView: View {

    @State var annotations: [MGLPointAnnotation] = []
    @State private var draggedOffset: CGFloat = CGFloat(-88)

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                MapView(annotations: self.$annotations)
                .centerCoordinate(.init(latitude: 37.791293, longitude: -122.396324))
                .zoomLevel(16)
                .edgesIgnoringSafeArea([.top, .bottom])

                HStack {
                    VStack {
                        Spacer()
                        BikeShareList()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: geometry.size.height)
                        .background(Color.green)
                        .offset(y: geometry.size.height + self.draggedOffset)
                        .gesture(DragGesture()
                            .onChanged { value in
                                print(value.translation.height)
                                // look into this a bbit more
//                                if value.translation.height < 0 {
//                                    self.draggedOffset = value.translation.height + 88
//                                } else {
//                                    self.draggedOffset = -value.translation.height - 88
//                                }
                            }
                            .onEnded { value in
                                // These animations are completed
                                withAnimation(.spring()) {
                                    if value.translation.height < -125 && value.translation.height > -300 {
                                        self.draggedOffset = -geometry.size.height / 2
                                    } else if value.translation.height < 0  {
                                        self.draggedOffset =  -geometry.size.height
                                    } else if value.translation.height > 125 && value.translation.height < 300 {
                                        self.draggedOffset = -geometry.size.height / 2
                                    } else {
                                        self.draggedOffset = -88
                                    }
                                }
                            }
                        )
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
