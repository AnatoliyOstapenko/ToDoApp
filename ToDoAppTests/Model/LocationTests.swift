//
//  LocationTests.swift
//  ToDoAppTests
//
//  Created by AnatoliiOstapenko on 17.07.2022.
//

import XCTest
import CoreLocation
@testable import ToDoApp

class LocationTests: XCTestCase {
    
    func testInitSetsName() {
        // Arrange
        let location = LocationModel(name: "Foo")
        // Assert
        XCTAssertNotNil(location.name)
        XCTAssertEqual(location.name, "Foo")
    }
    
    func testInitLocationModel() {
        // Arrange
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = LocationModel(name: "Foo", coordinate: coordinate)
        // Assert
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
        
    }
    
}
