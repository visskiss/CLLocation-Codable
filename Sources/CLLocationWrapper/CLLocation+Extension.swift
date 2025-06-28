import CoreLocation

extension CLLocation: @retroactive Encodable {
    internal enum CodingKeys: String, CodingKey {
        case coordinate, altitude, horizontalAccuracy, verticalAccuracy, speed, course, timestamp, speedAccuracy, courseAccuracy, sourceInformation
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(coordinate, forKey: .coordinate)
        try container.encode(altitude, forKey: .altitude)
        try container.encode(horizontalAccuracy, forKey: .horizontalAccuracy)
        try container.encode(verticalAccuracy, forKey: .verticalAccuracy)
        try container.encode(speed, forKey: .speed)
        try container.encode(course, forKey: .course)
        try container.encode(timestamp, forKey: .timestamp)
        try container.encode(speedAccuracy, forKey: .speedAccuracy)
        try container.encode(courseAccuracy, forKey: .courseAccuracy)
        try container.encode(courseAccuracy, forKey: .sourceInformation)
        try container.encode(sourceInformation, forKey: .sourceInformation)
    }
    
    static func == (lhs: CLLocation, rhs: CLLocation) -> Bool {
        let isBasicParamsEqual = lhs.coordinate == rhs.coordinate &&
            lhs.altitude == rhs.altitude &&
            lhs.horizontalAccuracy == rhs.horizontalAccuracy &&
            lhs.verticalAccuracy == rhs.verticalAccuracy &&
            lhs.course == rhs.course &&
            lhs.speed == rhs.speed &&
            lhs.timestamp == rhs.timestamp &&
            lhs.courseAccuracy == rhs.courseAccuracy &&
            lhs.speedAccuracy == rhs.speedAccuracy &&
            lhs.courseAccuracy == rhs.courseAccuracy &&
            lhs.speedAccuracy == rhs.speedAccuracy
        
            if let leftSourceInformation = lhs.sourceInformation,
               let rightSourceInformation = rhs.sourceInformation,
               leftSourceInformation == rightSourceInformation {
                return isBasicParamsEqual
            } else if lhs.sourceInformation == nil,
                      rhs.sourceInformation == nil {
                return isBasicParamsEqual
            }
            return false
            
    }
}
