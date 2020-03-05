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
    @State private var draggedOffset: CGSize = .zero

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
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: geometry.size.height / 2)
                        .background(Color.green)
                        .offset(y: self.draggedOffset.height)
                        .gesture(DragGesture()
                            .onChanged { value in
                                self.draggedOffset = value.translation
                            }
                            .onEnded { value in
                                self.draggedOffset = CGSize(width: .greatestFiniteMagnitude, height: -(geometry.size.height / 2))
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
