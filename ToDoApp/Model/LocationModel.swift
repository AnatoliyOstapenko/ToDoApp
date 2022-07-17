//
//  LocationModel.swift
//  ToDoApp
//
//  Created by AnatoliiOstapenko on 17.07.2022.
//

import Foundation
import CoreLocation

struct LocationModel {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

extension LocationModel: Equatable {
    
    static func == (lhs: LocationModel, rhs: LocationModel) -> Bool {
        guard lhs.coordinate?.longitude == rhs.coordinate?.longitude && lhs.coordinate?.latitude == rhs.coordinate?.latitude && lhs.name == rhs.name else { return false }
        return true
    }
}
