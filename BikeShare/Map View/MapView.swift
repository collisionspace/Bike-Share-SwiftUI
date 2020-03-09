//
//  MapView.swift
//  BikeShare
//
//  Created by Daniel Slone on 3/5/20.
//  Copyright © 2020 Daniel Slone. All rights reserved.
//

import SwiftUI
import Mapbox

struct MapView: UIViewRepresentable {

    @Binding var annotations: [MGLPointAnnotation]

    func makeUIView(context: Context) -> MGLMapView {
        let mapView: MGLMapView = MGLMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MGLMapView, context: Context) {
        view.addAnnotations(annotations)
    }

    func makeCoordinator() -> MapView.Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, MGLMapViewDelegate {
        var control: MapView

        init(_ control: MapView) {
            self.control = control
        }

        func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
            return nil
        }

        func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
            return true
        }
    }
}
