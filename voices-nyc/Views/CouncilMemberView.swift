//
//  CouncilMemberView.swift
//  voices-nyc
//
//  Created by John Bogil on 7/11/20.
//  Copyright © 2020 John Bogil. All rights reserved.
//

import SwiftUI

struct CouncilMemberView: View {
    var member: CouncilMember?
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
            Text("First Last")
            Text("District 7")
            Text("District phone: 516 458 9308")
            Text("Legislative phone: 516 458 9308")
            Spacer()
        }
    }
}

struct CouncilMemberView_Previews: PreviewProvider {
    static var previews: some View {
        let member = CouncilMember(name: "Test",
                                   district: 5,
                                   borough: Borough.queens,
                                   politicalParty: PoliticalParty.democrat,
                                   districtPhone: "516 458 9308",
                                   legislativePhone: "516 458 9308")

        return CouncilMemberView(member: member)
    }
}
