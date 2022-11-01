import XCTest
import CoreLocation

@testable import CLLocationWrapper

final class CLLocationWrapperTests: XCTestCase {
    
    
    func testCLLocationExtension_WhenLocationWrapsSavedAndLoaded_ThenItContainsTheSameData() {
        
        // erase location in user defaults
        saveToUserDefaults(locationWrapper: nil)
        var loadedLocationWrapper = loadFromUserDefaults()
        XCTAssertNil(loadedLocationWrapper)
        
        // save location into user defaults
        let location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 16.6, longitude: 12.5),
                                  altitude: 2.6,
                                  horizontalAccuracy: 1.8,
                                  verticalAccuracy: 9,
                                  course: 46.891,
                                  courseAccuracy: 65.2,
                                  speed: 1.5,
                                  speedAccuracy: 0,
                                  timestamp: Date(),
                                  sourceInfo: CLLocationSourceInformation(softwareSimulationState: true,
                                                                          andExternalAccessoryState: false))
       
        let locationWrapper = CLLocationWrapper(location: location)
        XCTAssertNotNil(locationWrapper.location)
       
        // load location from user defaults
        saveToUserDefaults(locationWrapper: locationWrapper)
        loadedLocationWrapper = loadFromUserDefaults()
        XCTAssertTrue(loadedLocationWrapper == locationWrapper)
    }
    
    func test_nil_source_info() {
        
        // erase location in user defaults
        saveToUserDefaults(locationWrapper: nil)
        var loadedLocationWrapper = loadFromUserDefaults()
        XCTAssertNil(loadedLocationWrapper)
        
        // save location into user defaults
        let location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 27.333, longitude: 56.4444),
                                  altitude: 2.6,
                                  horizontalAccuracy: 6,
                                  verticalAccuracy: 9,
                                  course: 46.891,
                                  courseAccuracy: 65.2,
                                  speed: 1.5,
                                  speedAccuracy: 0,
                                  timestamp: Date())
       
        let locationWrapper = CLLocationWrapper(location: location)
        XCTAssertNotNil(locationWrapper.location)
       
        // load location from user defaults
        saveToUserDefaults(locationWrapper: locationWrapper)
        loadedLocationWrapper = loadFromUserDefaults()
        XCTAssertTrue(loadedLocationWrapper == locationWrapper)
    }
    
    func test_3() {
        
        // erase location in user defaults
        saveToUserDefaults(locationWrapper: nil)
        var loadedLocationWrapper = loadFromUserDefaults()
        XCTAssertNil(loadedLocationWrapper)
        
        // save location into user defaults
        let location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 27.333, longitude: 56.4444),
                                  altitude: 2.6,
                                  horizontalAccuracy: 6,
                                  verticalAccuracy: 9,
                                  course: 46.891,
                                  speed: 1.5,
                                  timestamp: Date())
       
        let locationWrapper = CLLocationWrapper(location: location)
        XCTAssertNotNil(locationWrapper.location)
       
        // load location from user defaults
        saveToUserDefaults(locationWrapper: locationWrapper)
        loadedLocationWrapper = loadFromUserDefaults()
        XCTAssertTrue(loadedLocationWrapper == locationWrapper)
    }
    
    func test_4() {
        
        // erase location in user defaults
        saveToUserDefaults(locationWrapper: nil)
        var loadedLocationWrapper = loadFromUserDefaults()
        XCTAssertNil(loadedLocationWrapper)
        
        // save location into user defaults
        let location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 27.333, longitude: 56.4444),
                                  altitude: 2.6,
                                  horizontalAccuracy: 6,
                                  verticalAccuracy: 9,
                                  timestamp: Date())
       
        let locationWrapper = CLLocationWrapper(location: location)
        XCTAssertNotNil(locationWrapper.location)
       
        // load location from user defaults
        saveToUserDefaults(locationWrapper: locationWrapper)
        loadedLocationWrapper = loadFromUserDefaults()
        XCTAssertTrue(loadedLocationWrapper == locationWrapper)
    }
    
    func test_5() {
        
        // erase location in user defaults
        saveToUserDefaults(locationWrapper: nil)
        var loadedLocationWrapper = loadFromUserDefaults()
        XCTAssertNil(loadedLocationWrapper)
        
        // save location into user defaults
        let location = CLLocation(latitude: 27.333, longitude: 56.4444)
       
        let locationWrapper = CLLocationWrapper(location: location)
        XCTAssertNotNil(locationWrapper.location)
       
        // load location from user defaults
        saveToUserDefaults(locationWrapper: locationWrapper)
        loadedLocationWrapper = loadFromUserDefaults()
        XCTAssertTrue(loadedLocationWrapper == locationWrapper)
    }
    
    private func saveToUserDefaults(locationWrapper: CLLocationWrapper?) {
        if let locationWrapper = locationWrapper,
           let encoded = try? JSONEncoder().encode(locationWrapper.location) {
            UserDefaults.standard.set(encoded, forKey: "locationWrapperTest")
        } else {
            UserDefaults.standard.set(nil, forKey: "locationWrapperTest")
        }
    }
    
    private func loadFromUserDefaults() -> CLLocationWrapper? {
        if let da = UserDefaults.standard.value(forKey: "locationWrapperTest") as? Data,
           let object = try? JSONDecoder().decode(CLLocationWrapper.self, from: da) {
            return object
        }
        return nil
    }
}
