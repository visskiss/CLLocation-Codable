import CoreLocation


public struct CLLocationSourceInformationWrapper: Codable {
    var sourceInfo: CLLocationSourceInformation
    
    init(sourceInfo: CLLocationSourceInformation) {
        self.sourceInfo = sourceInfo
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CLLocationSourceInformation.CodingKeys.self)
        
        let isSimulatedBySoftware = try container.decode(Bool.self, forKey: .isSimulatedBySoftware)
        let isProducedByAccessory = try container.decode(Bool.self, forKey: .isProducedByAccessory)
        
        let sourceInfo = CLLocationSourceInformation(softwareSimulationState: isSimulatedBySoftware, andExternalAccessoryState: isProducedByAccessory)

        self.init(sourceInfo: sourceInfo)
    }
}
