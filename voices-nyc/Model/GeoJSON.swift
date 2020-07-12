// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct DistrictJSON: Codable {
    let type: String
    let features: [Feature]
}

// MARK: - Feature
struct Feature: Codable {
    let type: FeatureType
    let properties: Properties
    let geometry: Geometry
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: GeometryType
    let coordinates: [[[[Double]]]]
}

enum GeometryType: String, Codable {
    case multiPolygon = "MultiPolygon"
}

// MARK: - Properties
struct Properties: Codable {
    let counDist, shapeArea, shapeLeng: String

    enum CodingKeys: String, CodingKey {
        case counDist = "coun_dist"
        case shapeArea = "shape_area"
        case shapeLeng = "shape_leng"
    }
}

enum FeatureType: String, Codable {
    case feature = "Feature"
}
