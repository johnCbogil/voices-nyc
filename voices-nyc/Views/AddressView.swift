//
//  AddressView.swift
//  voices-nyc
//
//  Created by John Bogil on 7/11/20.
//  Copyright © 2020 John Bogil. All rights reserved.
//

import SwiftUI

struct AddressView: View {

    @State var username: String = ""
    var member: CouncilMember?

    var body: some View {
        NavigationView {
            VStack {
                TextField("\"123 Fulton Street, Brooklyn, NY, 11201\"", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                CTAButton(text: "Submit")
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
