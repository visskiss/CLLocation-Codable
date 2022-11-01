import CoreLocation

public struct CLLocationCoordinate2DWrapper: Codable {
    public var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CLLocationCoordinate2D.CodingKeys.self)
        
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        self.init(coordinate: coordinate)
    }
}
