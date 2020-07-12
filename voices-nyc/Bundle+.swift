//
//  Bundle+.swift
//  voices-nyc
//
//  Created by John Bogil on 7/4/20.
//  Copyright © 2020 John Bogil. All rights reserved.
//

import Foundation
extension Bundle {
    func decodeCouncilMembers(_ file: String) -> [CouncilMember] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode([CouncilMember].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }

    func decodeDistricts(_ file: String) -> DistrictJSON {
        guard let url = self.url(forResource: file, withExtension: nil) else {
                   fatalError("Failed to locate \(file) in bundle.")
               }

               guard let data = try? Data(contentsOf: url) else {
                   fatalError("Failed to load \(file) from bundle.")
               }

               let decoder = JSONDecoder()

               guard let loaded = try? decoder.decode(DistrictJSON.self, from: data) else {
                   fatalError("Failed to decode \(file) from bundle.")
               }
               return loaded
    }
}
