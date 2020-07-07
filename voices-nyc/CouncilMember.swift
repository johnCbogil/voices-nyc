// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - CouncilMember
struct CouncilMember: Codable, Identifiable {
    
    var id = UUID()
    let name: String
    let district: Int
    let borough: Borough
    let politicalParty: PoliticalParty
    let districtPhone: String
    let legislativePhone: String

    enum CodingKeys: String, CodingKey {
        case name = "NAME"
        case district = "DISTRICT"
        case borough = "BOROUGH"
        case politicalParty = "POLITICAL PARTY"
        case districtPhone = "DISTRICT PHONE"
        case legislativePhone = "LEGISLATIVE PHONE"
    }
}

enum Borough: String, Codable {
    case bronx = "Bronx"
    case brooklyn = "Brooklyn"
    case brooklynAndQueens = "Brooklyn and Queens"
    case manhattan = "Manhattan"
    case manhattanAndBronx = "Manhattan and Bronx"
    case queens = "Queens"
    case statenIsland = "Staten Island"
}

enum PoliticalParty: String, Codable {
    case democrat = "Democrat"
    case empty = ""
    case republican = "Republican"
}

