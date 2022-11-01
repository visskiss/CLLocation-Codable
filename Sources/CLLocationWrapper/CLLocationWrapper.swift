import CoreLocation

public struct CLLocationWrapper: Decodable, Equatable {
    public var location: CLLocation
    
    public init(location: CLLocation) {
        self.location = location
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CLLocation.CodingKeys.self)
        
        let coordinateWrapper = try container.decode(CLLocationCoordinate2DWrapper.self, forKey: .coordinate)
        let altitude = try container.decode(CLLocationDistance.self, forKey: .altitude)
        let horizontalAccuracy = try container.decode(CLLocationAccuracy.self, forKey: .horizontalAccuracy)
        let verticalAccuracy = try container.decode(CLLocationAccuracy.self, forKey: .verticalAccuracy)
        let speed = try container.decode(CLLocationSpeed.self, forKey: .speed)
        let course = try container.decode(CLLocationDirection.self, forKey: .course)
        let timestamp = try container.decode(Date.self, forKey: .timestamp)
        let courseAccuracy = try container.decode(CLLocationDirectionAccuracy.self, forKey: .courseAccuracy)
        let speedAccuracy = try container.decode(CLLocationSpeedAccuracy.self, forKey: .speedAccuracy)


        var location = CLLocation(coordinate: coordinateWrapper.coordinate,
                              altitude: altitude,
                              horizontalAccuracy: horizontalAccuracy,
                              verticalAccuracy: verticalAccuracy,
                              course: course,
                              courseAccuracy: courseAccuracy,
                              speed: speed,
                              speedAccuracy: speedAccuracy,
                              timestamp: timestamp)
        
        if #available(iOS 15.0, watchOS 8.0, tvOS 15.0, macOS 12.0, *) {
            let sourceInfoWrapper = try? container.decode(CLLocationSourceInformationWrapper.self, forKey: .sourceInformation)
            
            if let sourceInfoWrapper = sourceInfoWrapper {
                location = CLLocation(coordinate: coordinateWrapper.coordinate,
                                      altitude: altitude,
                                      horizontalAccuracy: horizontalAccuracy,
                                      verticalAccuracy: verticalAccuracy,
                                      course: course,
                                      courseAccuracy: courseAccuracy,
                                      speed: speed,
                                      speedAccuracy: speedAccuracy,
                                      timestamp: timestamp,
                                      sourceInfo: sourceInfoWrapper.sourceInfo)
            }
        }
        self.init(location: location)
    }
    
    public static func == (lhs: CLLocationWrapper, rhs: CLLocationWrapper) -> Bool {
        return lhs.location == rhs.location
    }
}
