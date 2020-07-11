//
//  DetailView.swift
//  voices-nyc
//
//  Created by John Bogil on 7/11/20.
//  Copyright © 2020 John Bogil. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var member: CouncilMember

    var body: some View {
        NavigationView {
            CouncilMemberView(member: member)
        }
        .navigationBarTitle("\(member.name)")
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let member = CouncilMember(name: "Test",
                                   district: 5,
                                   borough: Borough.queens,
                                   politicalParty: PoliticalParty.democrat,
                                   districtPhone: "516 458 9308",
                                   legislativePhone: "516 458 9308")
        return DetailView(member: member)
    }
}
