[![Swift 5.9](https://img.shields.io/badge/Swift-5.9-orange.svg?style=flat)](https://developer.apple.com/swift)
[[Platforms](https://img.shields.io/badge/Platforms-iOS_|_iPadOS_|_macOS_|_Mac_Catalyst_|_tvOS_|_watchOS-green?style=flat)](https://www.apple.com/ios/ios-15/)
[![Swift Package Index](https://img.shields.io/badge/Swift_Package_Index-compatible-blueviolet?style=flat)](https://github.com/yonivav/CLLocation-Codable)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-brown?style=flat)](https://www.swift.org/package-manager/)
[![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)](https://opensource.org/licenses/MIT)

# CLLocation+Codable
## Vision
A simple-to-use wrapper for CLLocation for encoding and decoding CLLocation and CLLocationCoordinate2D.

## Motivation

A lot of iOS applications work with the Core Location framework. The main object of Core Location is CLLocation, which represents a location. For some odd reason, Core Location doesn't conform to Codable protocol. Therefore, we can't serialize it by default, save it to a database, or send it through a network API.
This project solves that problem.

## Solution
In this code, I created a wrapper for CLLocation which you can use to serialize and deserialize CLLocation.
Enjoy!

P.S. Check the tests to see how it works and how to use CLLocationWrapper.

## Demo
Let's say you have a location:
```swift
import CoreLocation

let location = CLLocation(coordinate: CLLocationCoordinate2D(latitude: 16.6, longitude: 12.5),
                          altitude: 2.6,
                          horizontalAccuracy: 1.8,
                          verticalAccuracy: 9,
                          course: 46.891,
                          speed: 1.5,
                          timestamp: Date())
```

you may now serialize that directly, ie
```swift
class MyClass:Encodable {
    var location:CLLocation
 }
```
and voilà! it's serialized!

Now you can send it to a server, save it in User Defaults, or write it to a database:
```swift
let jsonEncoder = JSONEncoder()
do {
    let encodedLocation = try jsonEncoder.encode(location)
    // Do whatever you want with the location
} catch {
    print("Error! Location  encode failed: '\(error)'")
}
```

And how to decode it?

Very simple, but don't forget to unwrap. Because you are actually decoding the *wrapper* you have to use the `location` property of the `CLLocationWrapper` that you decode:
```swift
let jsonDecoder = JSONDecoder()
do {
    // decode the CLLocationWrapper
    let decodedLocationWrapper = try jsonDecoder.decode(CLLocationWrapper.self, from: encodedLocation)
    // use the location property to create the location
    let location = decodedLocationWrapper.location
    // Do whatever you want with the wrapped location
} catch {
    print("Error! Location wrapper decode failed: '\(error)'")
}

```

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding CLLocationWrapper as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/visskiss/CLLocation-Codable")
]
```

### Manually

If you prefer not to use any of the mentioned dependency managers, you can integrate CLLocationWrapper into your project manually.

## Contribution
You can contribute by adding new features, clarify the current code or fixing bugs. To do so, open a PR. When submitting a pull request, please add tests and ensure your changes don't break any existing tests.

## Credits
This repository was Inspired by this [package](https://github.com/yonivav/CLLocation-Codable)
