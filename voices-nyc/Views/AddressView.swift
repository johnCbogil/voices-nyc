//
//  AddressView.swift
//  voices-nyc
//
//  Created by John Bogil on 7/11/20.
//  Copyright © 2020 John Bogil. All rights reserved.
//

import SwiftUI
import CoreLocation

struct AddressView: View {

    let districtJSON = Bundle.main
        .decodeDistricts("nyc.geojson")

    @State var addressInput: String = ""
    var member: CouncilMember?

    var body: some View {
        NavigationView {
            VStack {
                TextField("\"123 Fulton Street, Brooklyn, NY, 11201\"", text: $addressInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                Button(action: {
                    // your action here
                    let address = "1 Infinite Loop, Cupertino, CA 95014"

                    let geoCoder = CLGeocoder()
                    geoCoder.geocodeAddressString(address) { (placemarks, error) in
                        guard
                            let placemarks = placemarks,
                            let location = placemarks.first?.location
                        else {
                            return
                        }

                        self.districtJSON.features.forEach({ feature in
                            let path = CGMutablePath()
                            let district = feature.properties.counDist
                            let geometry = feature.geometry
                            let coordinates = geometry.coordinates
                            coordinates.forEach({ array in
                                // The counter is here to check if its the initial point or not
                                var counter = 0
                                array.forEach({ subArray in
                                    subArray.forEach({ subSubArray in
                                        let point = CGPoint(x: subSubArray.last!, y: subSubArray.first!)
                                        if counter == 0 {
                                            path.move(to: point)
                                        } else {
                                            path.addLine(to: point)
                                        }
                                        counter += 1
                                    })
                                })
                            })
                        })
                    }
                }) {
                    Text("Submit")
                }
                CustomDivider().padding()
                CouncilMemberView(member: member)
                Spacer()
            }
        }.navigationBarTitle("Enter Address")
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        let member = CouncilMember(name: "Test",
                                   district: 5,
                                   borough: Borough.queens,
                                   politicalParty: PoliticalParty.democrat,
                                   districtPhone: "516 458 9308",
                                   legislativePhone: "516 458 9308")

        return AddressView(member: member)
    }
}
